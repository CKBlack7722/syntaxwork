from __future__ import annotations

import argparse
import json
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import openpyxl


SHEET_NAME = "檢核項目清單"
RESERVED_WORDS = {"and", "or", "not", "any", "range", "sysmis", "sys", "mod", "trunc"}


@dataclass(frozen=True)
class VarSpec:
    name: str
    kind: str
    width: int

    @property
    def is_numeric(self) -> bool:
        return self.kind == "數值"


@dataclass(frozen=True)
class ExternalCheckRule:
    row: int
    m: str
    p: str
    qid: str
    vars_text: str
    description: str
    note: str
    condition: str
    extra_vars: str


def cell_text(value: Any) -> str:
    if value is None:
        return ""
    if isinstance(value, float) and value.is_integer():
        return str(int(value))
    return str(value).strip()


def headers(ws: openpyxl.worksheet.worksheet.Worksheet) -> dict[str, int]:
    return {
        cell_text(value): idx
        for idx, value in enumerate(next(ws.iter_rows(min_row=1, max_row=1, values_only=True)), start=1)
        if cell_text(value)
    }


def split_vars(value: object) -> list[str]:
    if value is None:
        return []
    result: list[str] = []
    for part in re.split(r"\s*(?:\||,)\s*", str(value)):
        clean = part.strip()
        if clean and clean not in result:
            result.append(clean)
    return result


def load_var_specs(workbook_path: Path) -> dict[str, VarSpec]:
    wb = openpyxl.load_workbook(workbook_path, data_only=True, read_only=True)
    ws = wb["all"]
    specs: dict[str, VarSpec] = {}
    for row in ws.iter_rows(min_row=2, values_only=True):
        name, kind, width = row[:3]
        if not name:
            continue
        try:
            width_int = int(width)
        except (TypeError, ValueError):
            width_int = 2
        specs[str(name).strip()] = VarSpec(str(name).strip(), str(kind).strip(), width_int)
    return specs


def spec_for(var_name: str, specs: dict[str, VarSpec]) -> VarSpec:
    if is_aggregate_var(var_name):
        return VarSpec(var_name, "數值", 8)
    return specs.get(var_name, VarSpec(var_name, "數值", 2))


def display_expr(var_name: str, specs: dict[str, VarSpec]) -> str:
    spec = spec_for(var_name, specs)
    if spec.is_numeric:
        return f"string({var_name},n{spec.width})"
    return f"rtrim(ltrim({var_name}))"


def concat_parts(vars_to_show: list[str], specs: dict[str, VarSpec]) -> list[str]:
    parts: list[str] = []
    for index, var_name in enumerate(vars_to_show):
        parts.append(f'",{var_name}="' if index else f'"{var_name}="')
        parts.append(display_expr(var_name, specs))
    return parts


def render_compute_m(m_id: str, vars_to_show: list[str], specs: dict[str, VarSpec]) -> list[str]:
    parts = concat_parts(vars_to_show, specs)
    if len(parts) <= 4:
        return [f"compute m{m_id}=concat({','.join(parts)})."]
    lines = [f"compute m{m_id}=concat("]
    for index, part in enumerate(parts):
        suffix = "," if index < len(parts) - 1 else ""
        lines.append(f"  {part}{suffix}")
    lines.append(").")
    return lines


def condition_vars(condition: str, specs: dict[str, VarSpec]) -> list[str]:
    names = re.findall(r"\b[A-Za-z_][A-Za-z0-9_]*\b", condition)
    result: list[str] = []
    for name in names:
        if name.lower() in RESERVED_WORDS or name.isdigit():
            continue
        if name in specs and name not in result:
            result.append(name)
    return result


def message_text(rule: ExternalCheckRule) -> str:
    text = rule.description.replace('"', "'")
    return text[:230]


def unique(values: list[str]) -> list[str]:
    result: list[str] = []
    for value in values:
        if value and value not in result:
            result.append(value)
    return result


def is_aggregate_var(var_name: str) -> bool:
    return bool(re.fullmatch(r"sum[A-Za-z0-9_]+_min", var_name))


def range_vars(start_var: str, end_var: str, specs: dict[str, VarSpec]) -> list[str]:
    match1 = re.match(r"^([A-Za-z_]+)(\d+)$", start_var)
    match2 = re.match(r"^([A-Za-z_]+)(\d+)$", end_var)
    if not match1 or not match2 or match1.group(1) != match2.group(1):
        return [start_var, end_var]
    prefix = match1.group(1)
    start = int(match1.group(2))
    end = int(match2.group(2))
    pad_width = max(len(match1.group(2)), len(match2.group(2))) if match1.group(2).startswith("0") or match2.group(2).startswith("0") else 0
    step = 1 if start <= end else -1
    result = []
    for value in range(start, end + step, step):
        var = f"{prefix}{value:0{pad_width}d}" if pad_width else f"{prefix}{value}"
        spec = specs.get(var)
        if spec and spec.is_numeric and spec.width == 5:
            result.append(var)
    return result


def aggregate_source_vars(var_name: str, specs: dict[str, VarSpec]) -> list[str]:
    if not is_aggregate_var(var_name):
        return []
    body = var_name.removeprefix("sum").removesuffix("_min")
    parts = [part for part in body.split("_") if part]
    if len(parts) == 2:
        ranged = range_vars(f"v{parts[0]}", f"v{parts[1]}", specs)
        if len(ranged) > 2:
            return ranged
    result = []
    for part in parts:
        var = part if part.startswith("v") else f"v{part}"
        if var in specs:
            result.append(var)
    return result


def hhmm_minutes(var_name: str) -> str:
    return f"(trunc({var_name}/100)*60 + mod({var_name},100))"


def render_aggregate_computes(vars_to_show: list[str], specs: dict[str, VarSpec]) -> list[str]:
    lines: list[str] = []
    for var_name in vars_to_show:
        source_vars = aggregate_source_vars(var_name, specs)
        if not source_vars:
            continue
        expr = " + ".join(hhmm_minutes(var) for var in source_vars)
        lines.append(f"compute {var_name}={expr}.")
    return lines


def load_rules(workbook_path: Path) -> tuple[list[ExternalCheckRule], list[dict[str, Any]]]:
    wb = openpyxl.load_workbook(workbook_path, data_only=True, read_only=True)
    if SHEET_NAME not in wb.sheetnames:
        return [], [{"severity": "error", "row": "", "reason": f"missing sheet {SHEET_NAME}"}]
    ws = wb[SHEET_NAME]
    h = headers(ws)
    required = ["m", "p", "題號", "變項名稱", "檢核說明", "備註", "條件", "額外列出變項"]
    missing = [name for name in required if name not in h]
    if missing:
        return [], [{"severity": "error", "row": "", "reason": f"missing headers: {', '.join(missing)}"}]
    rules: list[ExternalCheckRule] = []
    skipped: list[dict[str, Any]] = []
    for row_idx in range(2, ws.max_row + 1):
        m = cell_text(ws.cell(row_idx, h["m"]).value)
        p = cell_text(ws.cell(row_idx, h["p"]).value)
        qid = cell_text(ws.cell(row_idx, h["題號"]).value)
        vars_text = cell_text(ws.cell(row_idx, h["變項名稱"]).value)
        desc = cell_text(ws.cell(row_idx, h["檢核說明"]).value)
        note = cell_text(ws.cell(row_idx, h["備註"]).value)
        condition = cell_text(ws.cell(row_idx, h["條件"]).value)
        extra_vars = cell_text(ws.cell(row_idx, h["額外列出變項"]).value)
        if not any([qid, vars_text, desc, note, condition]):
            continue
        if not condition:
            skipped.append({"severity": "warning", "row": row_idx, "qid": qid, "reason": "blank condition"})
            continue
        if not m or not p:
            skipped.append({"severity": "warning", "row": row_idx, "qid": qid, "reason": "blank m or p"})
            continue
        rules.append(ExternalCheckRule(row_idx, m, p, qid, vars_text, desc, note, condition, extra_vars))
    return rules, skipped


def render_rule(rule: ExternalCheckRule, specs: dict[str, VarSpec]) -> str:
    listed_vars = unique(condition_vars(rule.condition, specs) + split_vars(rule.vars_text) + split_vars(rule.extra_vars))
    lines = [
        f"* external check row {rule.row}: {rule.qid}.",
    ]
    lines.extend(render_aggregate_computes(listed_vars, specs))
    lines.extend([
        f"do if {rule.condition}.",
    ])
    lines.extend(render_compute_m(rule.m, listed_vars, specs))
    lines.extend(
        [
            f'compute p{rule.p}="{message_text(rule)}".',
            "end if.",
            "exec.",
            "",
        ]
    )
    return "\n".join(lines)


def render_spss(rules: list[ExternalCheckRule], specs: dict[str, VarSpec]) -> str:
    blocks = [
        "* Encoding: UTF-8.",
        "**EXTERNAL CHECK ITEMS.",
        "* SYNTAXWORK_BEGIN_EXTERNAL_CHECKS.",
    ]
    blocks.extend(render_rule(rule, specs) for rule in rules)
    blocks.append("* SYNTAXWORK_END_EXTERNAL_CHECKS.")
    return "\n".join(blocks).rstrip() + "\n"


def duplicate_mp_report(workbook_path: Path, rules: list[ExternalCheckRule]) -> list[dict[str, Any]]:
    wb = openpyxl.load_workbook(workbook_path, data_only=True, read_only=True)
    seen: dict[tuple[str, str], str] = {}
    issues: list[dict[str, Any]] = []
    for sheet_name in wb.sheetnames:
        if sheet_name.startswith("generated"):
            continue
        ws = wb[sheet_name]
        h = headers(ws)
        if "m" not in h and "p" not in h:
            continue
        for row_idx in range(2, ws.max_row + 1):
            for col_name in ("m", "p"):
                if col_name not in h:
                    continue
                value = cell_text(ws.cell(row_idx, h[col_name]).value)
                if not value:
                    continue
                key = (col_name, value)
                where = f"{sheet_name}!row{row_idx}"
                if key in seen:
                    issues.append({"severity": "error", "code": "duplicate_mp", "value": f"{col_name}{value}", "first": seen[key], "second": where})
                else:
                    seen[key] = where
    return issues


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--workbook", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--report", required=True, type=Path)
    args = parser.parse_args()

    specs = load_var_specs(args.workbook)
    rules, skipped = load_rules(args.workbook)
    duplicate_issues = duplicate_mp_report(args.workbook, rules)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(render_spss(rules, specs), encoding="utf-8-sig")
    report = {
        "rules": len(rules),
        "skipped": len(skipped),
        "duplicate_mp_issues": len(duplicate_issues),
        "skipped_rows": skipped,
        "duplicate_mp": duplicate_issues,
        "output": str(args.output),
    }
    args.report.parent.mkdir(parents=True, exist_ok=True)
    args.report.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    print(json.dumps(report, ensure_ascii=False))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
