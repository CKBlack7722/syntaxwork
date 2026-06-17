from __future__ import annotations

import argparse
import csv
import json
import re
import shutil
import unicodedata
from dataclasses import dataclass
from pathlib import Path

import openpyxl
from docx import Document


LOGIC_SHEET = "邏輯組"
ALL_SHEET = "all"
NEED_CUES = ("需回答此題", "需答此題", "才需回答此題", "才需答此題")
SKIP_CUES = ("不需回答此題", "不需答此題", "不須回答此題", "免答此題")
VERB_PATTERN = r"(有?回答|皆回答|有?答|皆答|未答|回答|選擇|選|為)"


@dataclass(frozen=True)
class Atom:
    expr: str
    inverse: str


@dataclass(frozen=True)
class Node:
    op: str
    children: tuple["Node | Atom", ...]


@dataclass(frozen=True)
class Rule:
    qid: str
    cue: str
    condition: str
    inverse_condition: str
    target_vars: tuple[str, ...]
    source_text: str


def cell_text(value: object) -> str:
    if value is None:
        return ""
    if isinstance(value, float) and value.is_integer():
        return str(int(value))
    return str(value).strip()


def normalize_text(value: str) -> str:
    text = unicodedata.normalize("NFKC", value or "")
    text = text.replace("～", "~").replace("−", "-")
    text = re.sub(r"\s+", "", text)
    return text


def norm_qid(qid: str) -> str:
    qid = unicodedata.normalize("NFKC", qid or "").upper().strip()

    def strip_zero(match: re.Match[str]) -> str:
        prefix, number = match.groups()
        return prefix + str(int(number))

    return re.sub(r"([A-Z]+)0+(\d+)", strip_zero, qid)


def doc_text_units(docx_path: Path) -> list[str]:
    doc = Document(docx_path)
    units: list[str] = []
    current_qid = ""
    for paragraph in doc.paragraphs:
        text = paragraph.text.strip()
        if text:
            clean = unicodedata.normalize("NFKC", text)
            match = re.match(r"\s*([A-Z][A-Z0-9_]{0,12})(?=[^A-Z0-9_]|$)", clean)
            if match:
                current_qid = norm_qid(match.group(1))
            units.append(text)
            normalized = normalize_text(text)
            has_logic_cue = any(cue in normalized for cue in (*SKIP_CUES, *NEED_CUES))
            if current_qid and has_logic_cue and not match:
                units.append(f"{current_qid} {text}")
    for table in doc.tables:
        for row in table.rows:
            cells = [cell.text.strip().replace("\n", " ") for cell in row.cells if cell.text.strip()]
            if cells:
                units.append(" ".join(cells))
    return units


def load_all_vars(workbook_path: Path) -> set[str]:
    wb = openpyxl.load_workbook(workbook_path, data_only=True, read_only=True)
    ws = wb[ALL_SHEET]
    return {cell_text(row[0]) for row in ws.iter_rows(min_row=2, values_only=True) if cell_text(row[0])}


def logic_headers(ws: openpyxl.worksheet.worksheet.Worksheet) -> dict[str, int]:
    headers = {cell_text(ws.cell(1, col).value): col for col in range(1, ws.max_column + 1)}
    for required in ("m", "p", "條件", "應答", "不應答", "限制"):
        if required not in headers:
            raise ValueError(f"{LOGIC_SHEET} missing header: {required}")
    return headers


def existing_keys(ws: openpyxl.worksheet.worksheet.Worksheet, headers: dict[str, int]) -> set[tuple[str, str, str, str]]:
    keys: set[tuple[str, str, str, str]] = set()
    for row in range(2, ws.max_row + 1):
        keys.add(
            (
                cell_text(ws.cell(row, headers["條件"]).value),
                cell_text(ws.cell(row, headers["應答"]).value),
                cell_text(ws.cell(row, headers["不應答"]).value),
                cell_text(ws.cell(row, headers["限制"]).value),
            )
        )
    return keys


def qid_from_text(text: str) -> str:
    clean = unicodedata.normalize("NFKC", text.strip())
    clean = re.sub(r"^[\s*◎●○壹貳參一二三四五六七八九十、.()（）-]+", "", clean)
    match = re.match(r"([A-Z][A-Z0-9_]{0,12})(?=[^A-Z0-9_]|$)", clean)
    return norm_qid(match.group(1)) if match else ""


def find_all_var(name: str, all_vars: set[str]) -> str:
    if name in all_vars:
        return name
    lower = name.lower()
    for var_name in all_vars:
        if var_name.lower() == lower:
            return var_name
    return ""


def target_vars_for_qid(qid: str, all_vars: set[str]) -> tuple[str, ...]:
    qid = norm_qid(qid)
    base = f"v{qid}"
    exact = find_all_var(base, all_vars)
    if exact:
        return (exact,)
    pattern = re.compile(rf"^v{re.escape(qid)}(?:m\d+|s[A-Za-z0-9_]+|s\d+|g\d+|city|town)$", re.IGNORECASE)
    found = [name for name in all_vars if pattern.match(name)]
    return tuple(sorted(found, key=natural_key))


def natural_key(value: str) -> tuple[object, ...]:
    parts = re.split(r"(\d+)", value)
    return tuple(int(part) if part.isdigit() else part.lower() for part in parts)


def option_expr(qid: str, code: str, all_vars: set[str]) -> Node | Atom | None:
    qid = norm_qid(qid)
    code_num = str(int(code))
    code2 = f"{int(code):02d}"
    for var_name in (f"v{qid}m{code2}", f"v{qid}m{code_num}"):
        exact = find_all_var(var_name, all_vars)
        if exact:
            return Atom(f"{exact} in 1", f"{exact}~=1")
    base = f"v{qid}"
    exact = find_all_var(base, all_vars)
    if exact:
        return Atom(f"{exact} in {code_num}", f"{exact}~={code_num}")
    grouped = tuple(name for name in target_vars_for_qid(qid, all_vars) if re.match(rf"^v{re.escape(qid)}g\d+$", name, re.IGNORECASE))
    if grouped and code_num == "0":
        return combine("&", [Atom(f"{name} in 0", f"{name}~=0") for name in grouped])
    return None


def expand_codes(tail: str) -> list[str]:
    codes: list[str] = []
    for start, end in re.findall(r"\(?(\d+)\)?(?:\s*[~\-至]\s*\(?(\d+)\)?)?", tail):
        if end:
            a, b = int(start), int(end)
            step = 1 if a <= b else -1
            codes.extend(str(value) for value in range(a, b + step, step))
        else:
            codes.append(str(int(start)))
    return codes


def render_node(node: Node | Atom, parent_op: str = "") -> str:
    if isinstance(node, Atom):
        return node.expr
    joiner = f" {node.op} "
    text = joiner.join(render_node(child, node.op) for child in node.children)
    if parent_op and parent_op != node.op and len(node.children) > 1:
        return f"({text})"
    return text


def invert_node(node: Node | Atom, parent_op: str = "") -> str:
    if isinstance(node, Atom):
        return node.inverse
    inverted_op = "|" if node.op == "&" else "&"
    text = f" {inverted_op} ".join(invert_node(child, inverted_op) for child in node.children)
    if parent_op and parent_op != inverted_op and len(node.children) > 1:
        return f"({text})"
    return text


def combine(op: str, children: list[Node | Atom]) -> Node | Atom | None:
    compact = [child for child in children if child]
    if not compact:
        return None
    if len(compact) == 1:
        return compact[0]
    return Node(op, tuple(compact))


def parse_condition_atom(part: str, all_vars: set[str]) -> Node | Atom | None:
    part = normalize_text(part)
    part = re.sub(r"者$", "", part)
    part = re.sub(r"([A-Z][A-Z0-9_]*)" + VERB_PATTERN + r"\((\d+)\)[、,]?或\((\d+)\)", r"\1\2(\3)或\1\2(\4)", part)
    or_nodes: list[Node | Atom] = []
    qid_or_before_verb = re.search(r"^[A-Z][A-Z0-9_]*(?:或[A-Z][A-Z0-9_]*)+" + VERB_PATTERN, part)
    or_parts = [part] if qid_or_before_verb else re.split(r"或", part)
    for or_part in or_parts:
        or_part = or_part.strip(" ,，、")
        if not or_part:
            continue
        match = re.search(r"([A-Z][A-Z0-9_]*(?:[、,，及和或][A-Z][A-Z0-9_]*)*)" + VERB_PATTERN + r"(.+)$", or_part)
        if not match:
            return None
        qid_text = match.group(1)
        qids = [norm_qid(q) for q in re.findall(r"[A-Z][A-Z0-9_]*", qid_text)]
        verb = match.group(2)
        codes = expand_codes(match.group(3))
        if not qids or not codes:
            return None
        qid_nodes: list[Node | Atom] = []
        for qid in qids:
            code_atoms = [option_expr(qid, code, all_vars) for code in codes]
            found_atoms = [atom for atom in code_atoms if atom]
            if not found_atoms:
                return None
            if len(found_atoms) != len(code_atoms) and len(codes) <= 10:
                return None
            qid_node = combine("|", found_atoms)
            if qid_node and verb == "未答":
                qid_node = Atom(invert_node(qid_node), render_node(qid_node))
            qid_nodes.append(qid_node)
        qids_relation = "|" if "或" in qid_text else "&"
        qid_node = combine(qids_relation, [node for node in qid_nodes if node])
        if qid_node:
            or_nodes.append(qid_node)
    return combine("|", or_nodes)


def parse_condition(condition_text: str, all_vars: set[str]) -> tuple[str, str] | None:
    text = normalize_text(condition_text)
    text = text.strip("【】[]()（）,，;；。")
    if not text:
        return None
    and_nodes: list[Node | Atom] = []
    for part in re.split(r"且|並且|以及", text):
        part = part.strip(" ,，、")
        if not part:
            continue
        node = parse_condition_atom(part, all_vars)
        if node is None:
            return None
        and_nodes.append(node)
    root = combine("&", and_nodes)
    if root is None:
        return None
    return render_node(root), invert_node(root)


def grouped_expr(exprs: list[str], op: str) -> str:
    unique: list[str] = []
    for expr in exprs:
        if expr and expr not in unique:
            unique.append(expr)
    if len(unique) == 1:
        return unique[0]
    wrapped = [f"({expr})" if " | " in expr or " & " in expr else expr for expr in unique]
    return f" {op} ".join(wrapped)


def bracket_rules(text: str, all_vars: set[str]) -> tuple[list[Rule], list[dict[str, str]]]:
    source = unicodedata.normalize("NFKC", text)
    qid = qid_from_text(source)
    rules: list[Rule] = []
    review: list[dict[str, str]] = []
    if not qid:
        return rules, review
    targets = target_vars_for_qid(qid, all_vars)
    parsed_rules: list[tuple[str, str, str]] = []
    for bracket in re.findall(r"【([^】]+)】", source):
        normalized = normalize_text(bracket)
        cue = ""
        if any(skip in normalized for skip in SKIP_CUES):
            cue = "skip"
        elif any(need in normalized for need in NEED_CUES):
            cue = "need"
        else:
            continue
        if not targets:
            review.append({"qid": qid, "reason": "target variables not found in all sheet", "text": source, "bracket": bracket})
            continue
        condition_text = normalized
        for phrase in (*SKIP_CUES, *NEED_CUES):
            condition_text = condition_text.replace(phrase, "")
        condition_text = condition_text.replace("才", "")
        parsed = parse_condition(condition_text, all_vars)
        if not parsed:
            review.append({"qid": qid, "reason": "cannot parse condition", "text": source, "bracket": bracket})
            continue
        condition, inverse = parsed
        parsed_rules.append((cue, condition, inverse))
    for grouped_cue in ("need", "skip"):
        cue_rules = [item for item in parsed_rules if item[0] == grouped_cue]
        if not cue_rules:
            continue
        if grouped_cue == "need":
            condition = grouped_expr([item[1] for item in cue_rules], "&")
            inverse = grouped_expr([item[2] for item in cue_rules], "|")
        else:
            condition = grouped_expr([item[1] for item in cue_rules], "|")
            inverse = grouped_expr([item[2] for item in cue_rules], "&")
        rules.append(Rule(qid=qid, cue=grouped_cue, condition=condition, inverse_condition=inverse, target_vars=targets, source_text=source))
    return rules, review


def build_rows(rules: list[Rule]) -> list[dict[str, str]]:
    rows: list[dict[str, str]] = []
    for rule in rules:
        targets = ",".join(rule.target_vars)
        if rule.cue == "need":
            rows.append({"條件": rule.condition, "應答": targets, "不應答": "", "限制": "", "qid": rule.qid, "source": rule.source_text, "direction": "need"})
            rows.append({"條件": rule.inverse_condition, "應答": "", "不應答": targets, "限制": "", "qid": rule.qid, "source": rule.source_text, "direction": "need_inverse"})
        else:
            rows.append({"條件": rule.condition, "應答": "", "不應答": targets, "限制": "", "qid": rule.qid, "source": rule.source_text, "direction": "skip"})
            rows.append({"條件": rule.inverse_condition, "應答": targets, "不應答": "", "限制": "", "qid": rule.qid, "source": rule.source_text, "direction": "skip_inverse"})
    return rows


def write_csv(path: Path, rows: list[dict[str, str]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fieldnames = ["status", "row", "qid", "direction", "條件", "應答", "不應答", "限制", "source", "reason", "bracket", "text"]
    with path.open("w", newline="", encoding="utf-8-sig") as fh:
        writer = csv.DictWriter(fh, fieldnames=fieldnames, extrasaction="ignore")
        writer.writeheader()
        for row in rows:
            writer.writerow(row)


def refresh_logic(docx_path: Path, workbook_path: Path, *, apply: bool, qid_filter: str = "", csv_path: Path | None = None, report_path: Path | None = None) -> dict[str, object]:
    all_vars = load_all_vars(workbook_path)
    units = doc_text_units(docx_path)
    rules: list[Rule] = []
    review: list[dict[str, str]] = []
    for unit in units:
        unit_rules, unit_review = bracket_rules(unit, all_vars)
        rules.extend(unit_rules)
        review.extend(unit_review)
    if qid_filter:
        qid_filter = norm_qid(qid_filter)
        rules = [rule for rule in rules if rule.qid == qid_filter]
        review = [item for item in review if item.get("qid") == qid_filter]

    proposed = build_rows(rules)
    wb = openpyxl.load_workbook(workbook_path)
    ws = wb[LOGIC_SHEET]
    headers = logic_headers(ws)
    keys = existing_keys(ws, headers)
    output_rows: list[dict[str, str]] = []
    appended = 0
    duplicates = 0
    for row in proposed:
        key = (row["條件"], row["應答"], row["不應答"], row["限制"])
        if key in keys:
            duplicates += 1
            output_rows.append({"status": "duplicate", "row": "", **row})
            continue
        if apply:
            next_row = ws.max_row + 1
            for col_name in ("條件", "應答", "不應答", "限制"):
                ws.cell(next_row, headers[col_name]).value = row[col_name]
            output_rows.append({"status": "appended", "row": str(next_row), **row})
            keys.add(key)
            appended += 1
        else:
            output_rows.append({"status": "proposal", "row": "", **row})
    for item in review:
        output_rows.append({"status": "review", "row": "", "direction": "", "條件": "", "應答": "", "不應答": "", "限制": "", **item})

    if apply and appended:
        backup = workbook_path.parent / "generated" / f"{workbook_path.stem}.before_logic_refresh.xlsx"
        backup.parent.mkdir(parents=True, exist_ok=True)
        if not backup.exists():
            shutil.copy2(workbook_path, backup)
        wb.save(workbook_path)

    if csv_path:
        write_csv(csv_path, output_rows)
    report = {
        "docx": str(docx_path),
        "workbook": str(workbook_path),
        "apply": apply,
        "qid_filter": qid_filter,
        "source_units": len(units),
        "rules": len(rules),
        "proposed_rows": len(proposed),
        "appended": appended,
        "duplicates": duplicates,
        "review": len(review),
    }
    if report_path:
        report_path.parent.mkdir(parents=True, exist_ok=True)
        report_path.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    return report


def main() -> None:
    parser = argparse.ArgumentParser(description="Refresh missing questionnaire-derived logic rows in the Excel 邏輯組 sheet.")
    parser.add_argument("--docx", required=True, type=Path)
    parser.add_argument("--workbook", required=True, type=Path)
    parser.add_argument("--apply", action="store_true")
    parser.add_argument("--qid", default="")
    parser.add_argument("--proposal-csv", type=Path)
    parser.add_argument("--report", type=Path)
    args = parser.parse_args()
    report = refresh_logic(
        args.docx,
        args.workbook,
        apply=args.apply,
        qid_filter=args.qid,
        csv_path=args.proposal_csv,
        report_path=args.report,
    )
    print(json.dumps(report, ensure_ascii=False))


if __name__ == "__main__":
    main()
