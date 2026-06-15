from __future__ import annotations

import argparse
import json
import re
from dataclasses import dataclass
from pathlib import Path

import openpyxl


@dataclass(frozen=True)
class MultiRule:
    m: str
    p: str
    question_id: str
    group: str
    vars: tuple[str, ...]


@dataclass(frozen=True)
class MutexRule:
    m: str
    p: str
    question_id: str
    group: str
    exclusive_option: str
    exclusive_var: str
    other_start_var: str
    other_end_var: str


def cell_text(value: object) -> str:
    if value is None:
        return ""
    text = str(value).strip()
    return "" if text.lower() == "none" else text


def id_from_m(m_value: object, fallback: str) -> str:
    text = cell_text(m_value)
    return text or fallback


def headers(ws: openpyxl.worksheet.worksheet.Worksheet) -> list[str]:
    return [cell_text(cell.value) for cell in ws[1]]


def rows_as_dicts(ws: openpyxl.worksheet.worksheet.Worksheet) -> list[dict[str, object]]:
    names = headers(ws)
    rows: list[dict[str, object]] = []
    for row in ws.iter_rows(min_row=2, values_only=True):
        if not any(cell is not None and cell_text(cell) for cell in row):
            continue
        rows.append(dict(zip(names, row)))
    return rows


def group_from_var(var_name: str) -> str:
    match = re.match(r"(?P<group>.+?)m\d+$", var_name)
    if not match:
        return var_name
    return match.group("group")


def option_width(var_name: str) -> int:
    match = re.search(r"m(?P<option>\d+)$", var_name)
    if not match:
        return 0
    return len(match.group("option"))


def option_var(group: str, option: object, width_hint: int) -> str:
    raw = cell_text(option)
    if not raw:
        raise ValueError(f"empty option for group {group}")
    try:
        number = int(float(raw))
    except ValueError:
        return raw if raw.startswith(group) else f"{group}m{raw}"
    if width_hint > 1:
        return f"{group}m{number:0{width_hint}d}"
    return f"{group}m{number}"


def display_candidates(question_id: str) -> tuple[str, ...]:
    if question_id.startswith("v"):
        return (question_id,)
    return (f"v{question_id}", question_id)


def load_var_groups(workbook_path: Path) -> dict[str, tuple[str, ...]]:
    wb = openpyxl.load_workbook(workbook_path, read_only=True, data_only=True)
    if "複選題變項清單" not in wb.sheetnames:
        return {}
    ws = wb["複選題變項清單"]
    groups: dict[str, list[str]] = {}
    for row in ws.iter_rows(min_row=2, values_only=True):
        var_name = cell_text(row[0] if row else None)
        if not var_name:
            continue
        group = group_from_var(var_name)
        groups.setdefault(group, []).append(var_name)
    return {group: tuple(vars_) for group, vars_ in groups.items()}


def resolve_group(question_id: str, groups: dict[str, tuple[str, ...]]) -> str | None:
    for candidate in display_candidates(question_id):
        if candidate in groups:
            return candidate
    return None


def load_multi_rules(workbook_path: Path) -> tuple[list[MultiRule], list[str]]:
    wb = openpyxl.load_workbook(workbook_path, read_only=True, data_only=True)
    var_groups = load_var_groups(workbook_path)
    warnings: list[str] = []
    if "複選題_301-400" not in wb.sheetnames:
        warnings.append("missing sheet: 複選題_301-400")
        return [], warnings

    rules: list[MultiRule] = []
    for index, row in enumerate(rows_as_dicts(wb["複選題_301-400"]), start=2):
        m = id_from_m(row.get("m"), str(index - 1))
        p = id_from_m(row.get("p"), m)
        question_id = cell_text(row.get("題號"))
        if not question_id:
            warnings.append(f"row {index}: missing 題號")
            continue
        group = resolve_group(question_id, var_groups)
        if not group:
            warnings.append(f"row {index}: no variables found in 複選題變項清單 for {question_id}")
            continue
        rules.append(MultiRule(m=m, p=p, question_id=question_id, group=group, vars=var_groups[group]))
    return rules, warnings


def load_mutex_rules(workbook_path: Path) -> tuple[list[MutexRule], list[str]]:
    wb = openpyxl.load_workbook(workbook_path, read_only=True, data_only=True)
    var_groups = load_var_groups(workbook_path)
    warnings: list[str] = []
    if "複選題內_互斥" not in wb.sheetnames:
        warnings.append("missing sheet: 複選題內_互斥")
        return [], warnings

    rules: list[MutexRule] = []
    for index, row in enumerate(rows_as_dicts(wb["複選題內_互斥"]), start=2):
        m = id_from_m(row.get("m"), str(index - 1))
        p = id_from_m(row.get("p"), m)
        question_id = cell_text(row.get("題號"))
        if not question_id:
            warnings.append(f"row {index}: missing 題號")
            continue
        group = resolve_group(question_id, var_groups)
        if not group:
            warnings.append(f"row {index}: no variables found in 複選題變項清單 for {question_id}")
            continue
        vars_ = var_groups[group]
        width_hint = max(option_width(var_name) for var_name in vars_)
        exclusive = cell_text(row.get("互斥選項"))
        if not exclusive:
            warnings.append(f"row {index}: missing 互斥選項")
            continue
        try:
            exclusive_var = option_var(group, exclusive, width_hint)
            other_start_var = option_var(group, row.get("互斥選項編號_起"), width_hint)
            other_end_var = option_var(group, row.get("互斥選項編號_迄"), width_hint)
        except ValueError as exc:
            warnings.append(f"row {index}: {exc}")
            continue
        missing = [name for name in (exclusive_var, other_start_var, other_end_var) if name not in vars_]
        if missing:
            warnings.append(f"row {index}: variable not in 複選題變項清單: {', '.join(missing)}")
            continue
        rules.append(
            MutexRule(
                m=m,
                p=p,
                question_id=question_id,
                group=group,
                exclusive_option=exclusive,
                exclusive_var=exclusive_var,
                other_start_var=other_start_var,
                other_end_var=other_end_var,
            )
        )
    return rules, warnings


def string_format(var_name: str) -> str:
    return f"string({var_name},f2)"


def render_concat(question_id: str, vars_: tuple[str, ...]) -> str:
    parts: list[str] = []
    for index, var_name in enumerate(vars_):
        if index:
            parts.append('" , "')
        parts.append(f'"{var_name}="')
        parts.append(string_format(var_name))
    return f"COMPUTE {question_id} = Rtrim(Ltrim(concat({','.join(parts)})))."


def render_multi_rule(rule: MultiRule) -> str:
    first_var = rule.vars[0]
    last_var = rule.vars[-1]
    loop_to = len(rule.vars) - 1
    temp_name = re.sub(r"^v", "", rule.question_id)
    lines = [
        f"*{rule.question_id}.",
        f"vector a={first_var} to {last_var}.",
        f"COMPUTE #{temp_name}zero = (SUM({first_var} TO {last_var}) = 0).",
        f"loop #i=1 to {loop_to}.",
        "do if (any(a(#i),0,1) & any(a(#i+1),96))",
        f"| (any(a(#i),96) and not any(a(#i+1),96))|#{temp_name}zero=1.",
        f"compute m{rule.m}=Rtrim(Ltrim({rule.question_id})).",
        f'compute p{rule.p}="{rule.question_id}至少選1項或選特殊碼應一致".',
        "Break.",
        "end if.",
        "end loop.",
        "exec.",
    ]
    return "\n".join(lines)


def render_mutex_rule(rule: MutexRule) -> str:
    lines = [
        f"*{rule.question_id}={rule.exclusive_option} 複選題內互斥.",
        f"do if any({rule.exclusive_var},1) & any(1,{rule.other_start_var} to {rule.other_end_var}).",
        f"compute m{rule.m}=Rtrim(Ltrim({rule.question_id})).",
        f'compute p{rule.p}="{rule.question_id}({rule.exclusive_option})複選題選項應互斥".',
        "end if.",
        "Exec.",
    ]
    return "\n".join(lines)


def render_spss(multi_rules: list[MultiRule], mutex_rules: list[MutexRule]) -> str:
    question_ids = [rule.question_id for rule in multi_rules]
    lines = [
        "* Encoding: UTF-8.",
        "**3.複選題檢核.",
    ]
    if multi_rules:
        lines.append("* multiple response display strings.")
        lines.append(f"STRING {' '.join(question_ids)} (A600).")
        for rule in multi_rules:
            lines.append(render_concat(rule.question_id, rule.vars))
        lines.append("")
        for rule in multi_rules:
            lines.append(render_multi_rule(rule))
            lines.append("")
    lines.append("**3.1複選互斥邏輯.")
    if mutex_rules:
        lines.append("")
        for rule in mutex_rules:
            lines.append(render_mutex_rule(rule))
            lines.append("")
    return "\n".join(lines).rstrip() + "\n"


def write_report(path: Path, multi_rules: list[MultiRule], mutex_rules: list[MutexRule], warnings: list[str]) -> None:
    payload = {
        "multi_rule_count": len(multi_rules),
        "mutex_rule_count": len(mutex_rules),
        "warnings": warnings,
        "multi_rules": [rule.__dict__ for rule in multi_rules],
        "mutex_rules": [rule.__dict__ for rule in mutex_rules],
    }
    path.write_text(json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser(description="Generate SPSS multiple-response checks from workbook sheets.")
    parser.add_argument("--workbook", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--report", required=True, type=Path)
    args = parser.parse_args()

    multi_rules, multi_warnings = load_multi_rules(args.workbook)
    mutex_rules, mutex_warnings = load_mutex_rules(args.workbook)
    warnings = multi_warnings + mutex_warnings

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(render_spss(multi_rules, mutex_rules), encoding="utf-8")
    write_report(args.report, multi_rules, mutex_rules, warnings)

    print(f"wrote {args.output}")
    print(f"wrote {args.report}")
    print(f"multi rules: {len(multi_rules)}")
    print(f"mutex rules: {len(mutex_rules)}")
    print(f"warnings: {len(warnings)}")
    for warning in warnings:
        print(f"warning: {warning}")


if __name__ == "__main__":
    main()
