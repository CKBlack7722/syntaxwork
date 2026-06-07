from __future__ import annotations

import argparse
import json
import re
from dataclasses import dataclass
from pathlib import Path

import openpyxl


MISSING_CODES = "96,996,999996,9999996,9999999996,99969696969696"


@dataclass(frozen=True)
class VarSpec:
    name: str
    kind: str
    width: int

    @property
    def is_numeric(self) -> bool:
        return self.kind == "數值"


@dataclass(frozen=True)
class LogicRule:
    m: str
    p: str
    condition_raw: str
    condition_spss: str
    required_vars: tuple[str, ...]
    forbidden_vars: tuple[str, ...]
    limits: tuple[str, ...]


@dataclass(frozen=True)
class LogicSheetNormalization:
    corrected: tuple[dict[str, object], ...]
    unresolved: tuple[dict[str, object], ...]


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


RESERVED_WORDS = {"and", "or", "not", "any", "range", "sys", "in"}


def normalize_var_name(name: str, specs: dict[str, VarSpec]) -> tuple[str, bool, bool]:
    clean = name.strip()
    if not clean or clean.lower() in RESERVED_WORDS or clean.isdigit():
        return clean, False, True
    if clean in specs:
        return clean, False, True
    with_v = f"v{clean}"
    if with_v in specs:
        return with_v, True, True
    return clean, False, False


def normalize_condition_text(condition: str, specs: dict[str, VarSpec]) -> tuple[str, list[dict[str, object]]]:
    unresolved: list[dict[str, object]] = []

    def replace_token(match: re.Match[str]) -> str:
        token = match.group(0)
        normalized, changed, found = normalize_var_name(token, specs)
        if not found:
            unresolved.append({"token": token, "context": "條件"})
        return normalized if changed else token

    normalized = re.sub(r"\b[A-Za-z_][A-Za-z0-9_]*\b", replace_token, condition)
    return normalized, unresolved


def normalize_var_list_text(value: str, specs: dict[str, VarSpec], context: str) -> tuple[str, list[dict[str, object]]]:
    normalized_vars: list[str] = []
    unresolved: list[dict[str, object]] = []
    for var_name in split_vars(value):
        normalized, _changed, found = normalize_var_name(var_name, specs)
        if found:
            normalized_vars.append(normalized)
        else:
            unresolved.append({"token": var_name, "context": context})
            normalized_vars.append(var_name)
    return ",".join(normalized_vars), unresolved


def normalize_logic_sheet_variables(workbook_path: Path, specs: dict[str, VarSpec]) -> LogicSheetNormalization:
    wb = openpyxl.load_workbook(workbook_path)
    ws = wb["邏輯組"]
    corrected: list[dict[str, object]] = []
    unresolved: list[dict[str, object]] = []

    for row_idx in range(2, ws.max_row + 1):
        for col_idx, context in [(3, "條件"), (4, "應答"), (5, "不應答"), (6, "限制")]:
            cell = ws.cell(row_idx, col_idx)
            if cell.value is None or str(cell.value).strip() == "":
                continue
            original = str(cell.value).strip()
            if col_idx in (3, 6):
                normalized, cell_unresolved = normalize_condition_text(original, specs)
            else:
                normalized, cell_unresolved = normalize_var_list_text(original, specs, context)

            for item in cell_unresolved:
                unresolved.append({"row": row_idx, "column": context, **item})

            if normalized != original:
                cell.value = normalized
                corrected.append(
                    {
                        "row": row_idx,
                        "column": context,
                        "before": original,
                        "after": normalized,
                    }
                )

    if corrected:
        wb.save(workbook_path)

    return LogicSheetNormalization(tuple(corrected), tuple(unresolved))


def split_vars(value: object) -> tuple[str, ...]:
    if value is None:
        return ()
    return tuple(v.strip() for v in str(value).split(",") if v and v.strip())


def expand_values(text: str) -> list[str]:
    values: list[str] = []
    for part in [p.strip() for p in text.split(",") if p.strip()]:
        if "~" in part:
            start, end = [x.strip() for x in part.split("~", 1)]
            if start.lstrip("-").isdigit() and end.lstrip("-").isdigit():
                step = 1 if int(start) <= int(end) else -1
                values.extend(str(x) for x in range(int(start), int(end) + step, step))
            else:
                values.append(part)
        else:
            values.append(part)
    return values


def convert_condition(raw: str) -> str:
    condition = raw.strip()

    def replace_in(match: re.Match[str]) -> str:
        var_name = match.group("var")
        values = ",".join(expand_values(match.group("values")))
        return f"any({var_name},{values})"

    return re.sub(
        r"\b(?P<var>[A-Za-z_][A-Za-z0-9_]*)\s+in\s+(?P<values>[0-9,\-~\s]+)",
        replace_in,
        condition,
        flags=re.IGNORECASE,
    )


def condition_vars(condition: str) -> tuple[str, ...]:
    names = re.findall(r"\b[A-Za-z_][A-Za-z0-9_]*\b", condition)
    result: list[str] = []
    for name in names:
        if name.lower() in RESERVED_WORDS:
            continue
        if name not in result:
            result.append(name)
    return tuple(result)


def load_logic_rules(workbook_path: Path) -> list[LogicRule]:
    wb = openpyxl.load_workbook(workbook_path, data_only=True, read_only=True)
    ws = wb["邏輯組"]
    rules: list[LogicRule] = []
    for row in ws.iter_rows(min_row=2, values_only=True):
        m, p, condition, required, forbidden, limit = row[:6]
        if not m or not any(v not in (None, "") for v in [condition, required, forbidden, limit]):
            continue
        p_value = p if p not in (None, "") else m
        condition_raw = str(condition).strip() if condition not in (None, "") else ""
        rules.append(
            LogicRule(
                m=str(int(m)) if isinstance(m, float) else str(m).strip(),
                p=str(int(p_value)) if isinstance(p_value, float) else str(p_value).strip(),
                condition_raw=condition_raw,
                condition_spss=convert_condition(condition_raw) if condition_raw else "",
                required_vars=split_vars(required),
                forbidden_vars=split_vars(forbidden),
                limits=tuple(part.strip() for part in str(limit).split(";") if part.strip()) if limit not in (None, "") else (),
            )
        )
    return rules


def spec_for(var_name: str, specs: dict[str, VarSpec]) -> VarSpec:
    return specs.get(var_name, VarSpec(var_name, "數值", 2))


def display_expr(var_name: str, specs: dict[str, VarSpec]) -> str:
    spec = spec_for(var_name, specs)
    if spec.is_numeric:
        return f'string({var_name},n{spec.width})'
    return f"rtrim(ltrim({var_name}))"


def concat_parts(vars_to_show: list[str], specs: dict[str, VarSpec]) -> list[str]:
    parts: list[str] = []
    for index, var_name in enumerate(vars_to_show):
        label = f'"{var_name}="'
        if index > 0:
            parts.append(f'",{var_name}="')
        else:
            parts.append(label)
        parts.append(display_expr(var_name, specs))
    return parts


def concat_expr_single_line(vars_to_show: list[str], specs: dict[str, VarSpec]) -> str:
    return f"concat({','.join(concat_parts(vars_to_show, specs))})"


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


def answer_check(var_name: str, expect_answer: bool, specs: dict[str, VarSpec]) -> str:
    spec = spec_for(var_name, specs)
    if spec.is_numeric:
        flag = "1" if expect_answer else "0"
        return f"any({flag},{var_name}_96)"
    op = "=" if expect_answer else "~="
    return f'{var_name}{op}"96"'


def grouped_answer_check(vars_to_check: tuple[str, ...], expect_answer: bool, specs: dict[str, VarSpec]) -> str:
    checks = [answer_check(v, expect_answer, specs) for v in vars_to_check]
    if len(checks) == 1:
        return checks[0]
    return "(" + " | ".join(checks) + ")"


def unique_preserve_order(values: list[str]) -> list[str]:
    result: list[str] = []
    for value in values:
        if value not in result:
            result.append(value)
    return result


def render_rule(rule: LogicRule, specs: dict[str, VarSpec]) -> str:
    blocks: list[str] = []
    if rule.required_vars or rule.forbidden_vars:
        blocks.append(render_show_hide_rule(rule, specs))
    for limit in rule.limits:
        blocks.append(render_limit_rule(rule, limit, specs))
    return "\n".join(blocks)


def render_show_hide_rule(rule: LogicRule, specs: dict[str, VarSpec]) -> str:
    if rule.required_vars:
        target_vars = rule.required_vars
        expect_answer = True
        action = "show"
        message = f"{rule.condition_raw}，應答{','.join(target_vars)}而未答"
    else:
        target_vars = rule.forbidden_vars
        expect_answer = False
        action = "hide"
        message = f"{rule.condition_raw}，不應答{','.join(target_vars)}而答"

    vars_to_show = unique_preserve_order(list(condition_vars(rule.condition_spss)) + list(target_vars))
    check = grouped_answer_check(target_vars, expect_answer, specs)
    target_label = ",".join(target_vars)
    condition = f"({rule.condition_spss})" if rule.condition_spss else ""
    do_if = f"do if {condition} & {check}." if condition else f"do if {check}."
    lines = [
        f"* logic check {action} {target_label}.",
        do_if,
    ]
    lines.extend(render_compute_m(rule.m, vars_to_show, specs))
    lines.extend(
        [
            f'compute p{rule.p}="{message}".',
            "end if.",
            "",
        ]
    )
    return "\n".join(lines)


def parse_limit(limit: str) -> tuple[str, str, str]:
    match = re.match(
        r"^(?P<var>[A-Za-z_][A-Za-z0-9_]*)\s+(?P<op>not\s+in|in)\s+(?P<rhs>.+)$",
        limit,
        flags=re.IGNORECASE,
    )
    if match:
        return match.group("var"), " ".join(match.group("op").lower().split()), match.group("rhs").strip()

    match = re.match(
        r"^(?P<var>[A-Za-z_][A-Za-z0-9_]*)\s*(?P<op>~=|>=|<=|=|>|<)\s*(?P<rhs>.+)$",
        limit,
    )
    if not match:
        raise ValueError(f"Unsupported limit syntax: {limit}")
    return match.group("var"), match.group("op"), match.group("rhs").strip()


def rhs_vars(rhs: str) -> tuple[str, ...]:
    vars_found: list[str] = []
    for token in re.findall(r"\b[A-Za-z_][A-Za-z0-9_]*\b", rhs):
        if token.lower() not in RESERVED_WORDS and token not in vars_found:
            vars_found.append(token)
    return tuple(vars_found)


def invert_limit_to_violation(var_name: str, op: str, rhs: str) -> str:
    if op == "not in":
        return f"any({var_name},{','.join(expand_values(rhs))})"
    if op == "in":
        return f"not any({var_name},{','.join(expand_values(rhs))})"
    inverse_ops = {
        "<=": ">",
        "<": ">=",
        ">=": "<",
        ">": "<=",
        "=": "~=",
        "~=": "=",
    }
    return f"{var_name}{inverse_ops[op]}{rhs}"


def limit_message(limit: str, condition_raw: str) -> str:
    prefix = f"{condition_raw}，" if condition_raw else ""
    var_name, op, rhs = parse_limit(limit)
    if op == "not in":
        return f"{prefix}{var_name}不可為{rhs}"
    if op == "in":
        return f"{prefix}{var_name}應為{rhs}"
    return f"{prefix}{var_name}應{op}{rhs}"


def render_limit_rule(rule: LogicRule, limit: str, specs: dict[str, VarSpec]) -> str:
    var_name, op, rhs = parse_limit(limit)
    violation = invert_limit_to_violation(var_name, op, rhs)
    condition = f"({rule.condition_spss})" if rule.condition_spss else ""
    do_if = f"do if {condition} & {violation}." if condition else f"do if {violation}."
    vars_to_show = unique_preserve_order(list(condition_vars(rule.condition_spss)) + [var_name] + list(rhs_vars(rhs)))
    lines = [
        f"* logic check limit {var_name}.",
        do_if,
    ]
    lines.extend(render_compute_m(rule.m, vars_to_show, specs))
    lines.extend(
        [
            f'compute p{rule.p}="{limit_message(limit, rule.condition_raw)}".',
            "end if.",
            "",
        ]
    )
    return "\n".join(lines)


def render_spss(rules: list[LogicRule], specs: dict[str, VarSpec]) -> str:
    blocks = [
        "* Encoding: UTF-8.",
        "**LOGIC GROUP CHECKS.",
    ]
    blocks.extend(render_rule(rule, specs) for rule in rules)
    return "\n".join(blocks).rstrip() + "\n"


def extract_existing_logic(sps_path: Path) -> list[str]:
    text = sps_path.read_text(encoding="utf-8-sig")
    start = text.index("**4.邏輯檢核.")
    end = text.index("*檢核項目清單.", start)
    return [
        line.strip()
        for line in text[start:end].splitlines()
        if line.strip().lower().startswith("do if ") and "!i" not in line
    ]


def normalize_condition(condition: str) -> str:
    result = condition.strip().rstrip(".")
    result = re.sub(r"\s+", "", result)
    result = result.replace("~=", "!=")
    result = result.replace("= ", "=")
    result = re.sub(r"any\(([^,()]+),([0-9,]+)\)", lambda m: "any(" + m.group(1) + "," + ",".join(expand_values(m.group(2))) + ")", result)
    return result.lower()


def semantic_key_from_generated(rule: LogicRule, specs: dict[str, VarSpec]) -> dict[str, object]:
    target_vars = rule.required_vars or rule.forbidden_vars
    predicate = (
        f"{rule.condition_spss} & {grouped_answer_check(target_vars, bool(rule.required_vars), specs)}"
        if target_vars
        else rule.condition_spss
    )
    return {
        "m": rule.m,
        "condition": normalize_condition(rule.condition_spss),
        "mode": "required" if rule.required_vars else "forbidden" if rule.forbidden_vars else "limit",
        "targets": list(target_vars),
        "limits": list(rule.limits),
        "check": normalize_condition(grouped_answer_check(target_vars, bool(rule.required_vars), specs)) if target_vars else "",
        "predicate": normalize_condition(predicate),
    }


def existing_keys(lines: list[str]) -> list[str]:
    keys: list[str] = []
    for line in lines:
        expr = re.sub(r"^do if\s+", "", line, flags=re.I).rstrip(".")
        keys.append(normalize_condition(expr))
    return keys


def write_compare_report(
    report_path: Path,
    rules: list[LogicRule],
    specs: dict[str, VarSpec],
    existing_do_ifs: list[str] | None,
    normalization: LogicSheetNormalization,
) -> None:
    generated = [semantic_key_from_generated(rule, specs) for rule in rules]
    existing_normalized = existing_keys(existing_do_ifs) if existing_do_ifs is not None else []
    review = []
    for item in generated:
        review.append(
            {
                "m": item["m"],
                "condition": item["condition"],
                "mode": item["mode"],
                "targets": item["targets"],
                "expected_check": item["check"],
                "generated_predicate": item["predicate"],
                "matched_existing_do_if": item["predicate"] in existing_normalized,
            }
        )

    report = {
        "note": "Compare predicates only. Ignore m/p id differences and displayed mXXX field differences.",
        "generated_rule_count": len(generated),
        "existing_logic_do_if_count": len(existing_do_ifs) if existing_do_ifs is not None else None,
        "matched_count": sum(1 for item in review if item["matched_existing_do_if"]),
        "unmatched_count": sum(1 for item in review if not item["matched_existing_do_if"]),
        "generated_rules": generated,
        "logic_sheet_normalization": {
            "corrected_count": len(normalization.corrected),
            "unresolved_count": len(normalization.unresolved),
            "corrected": list(normalization.corrected),
            "unresolved": list(normalization.unresolved),
        },
        "existing_do_ifs": existing_do_ifs,
        "existing_normalized_do_ifs": existing_normalized,
        "review": review,
    }
    report_path.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--workbook", default="檢核程式套印-淨零.xlsx")
    parser.add_argument("--existing-sps", default=None)
    parser.add_argument("--output", default="generated/generated_logic_checks.sps")
    parser.add_argument("--report", default="generated/generated_logic_compare.json")
    args = parser.parse_args()

    workbook_path = Path(args.workbook)
    existing_sps_path = Path(args.existing_sps) if args.existing_sps else None
    output_path = Path(args.output)
    report_path = Path(args.report)

    specs = load_var_specs(workbook_path)
    normalization = normalize_logic_sheet_variables(workbook_path, specs)
    rules = load_logic_rules(workbook_path)

    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(render_spss(rules, specs), encoding="utf-8")
    existing_do_ifs = extract_existing_logic(existing_sps_path) if existing_sps_path and existing_sps_path.exists() else None
    write_compare_report(report_path, rules, specs, existing_do_ifs, normalization)

    print(f"wrote {output_path}")
    print(f"wrote {report_path}")
    print(f"rules: {len(rules)}")
    print(f"logic sheet corrections: {len(normalization.corrected)}")
    print(f"logic sheet unresolved: {len(normalization.unresolved)}")


if __name__ == "__main__":
    main()
