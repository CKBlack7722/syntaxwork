---
name: syntaxwork-external-checks
description: Import project-specific 資料檢核項目 Word tables into Syntaxwork Excel workbooks and generate reviewable SPSS syntax. Use when working on SPSS survey validation rules that are not part of basic questionnaire skip logic, numeric ranges, multiple-response checks, or open-field checks.
---

# Syntaxwork External Checks

Use this skill for project-specific check-item documents such as `資料檢核項目清單` Word files. These files usually contain tables with `題號`, `變項名稱`, `檢核說明`, and `備註`, and describe extra logical or quality-control checks that are not fully derivable from the questionnaire.

## Workflow

1. Extract all Word tables that contain `題號`, `變項名稱`, `檢核說明`, and `備註`.
2. Exclude rows whose `備註` clearly marks the item as deleted.
3. Add or update an Excel sheet named `檢核項目清單` with exactly these columns:

```text
m
p
題號
變項名稱
檢核說明
備註
條件
額外列出變項
```

4. Fill `題號`, `變項名稱`, `檢核說明`, and `備註` directly from the Word table.
5. Always leave `m` and `p` for the user. Do not auto-allocate them. Always check duplicate `m` and `p` values across SPSS-producing sheets before syntax generation.
6. Convert `檢核說明` into SPSS condition syntax in `條件`. Use `變項名稱` as the authoritative variable list, but inspect the description and questionnaire/Excel metadata when the rule references derived variables or related fields.
7. Fill `額外列出變項` only when `備註` or `檢核說明` asks the output message to include variables beyond those required by `條件`. Use comma-separated values, never `|`.
   - For notes such as `列出E5~E12加總合計時數`, first inspect the `all` sheet and include only variables that share the same time-field type and width.
   - Add generated aggregate variables before raw variables, for example `sumE5_E12_min,sumE5_E8_E11_min,vE5,vE6,vE8,vE9,vE11,vE12`.
8. Allow `條件` to remain blank. Generate SPSS syntax only from rows where `m`, `p`, and `條件` are present.

## Condition Rules

Generate `條件` as a boolean SPSS expression for rows that should be listed as problems or confirmations. Examples:

```spss
vB2 > 1200
(vE5 + vE6) > 1600
any(vO1, 12, 13) and sel_gen = 2
vK1m11 = 1 and not any(vKTT4m13, 1) and not any(vKTT4m14, 1) and not any(vKTT4, 97, 98)
```

Prefer explicit SPSS functions and operators:
- Use `any(var, ...)` for discrete option values.
- Use `range(var, low, high)` for inclusive ranges.
- Use direct comparisons for thresholds, such as `var > 1200`.
- For grouped variables, expand the expression explicitly instead of relying on ambiguous shorthand.
- For time values stored as HHMM numeric fields, confirm whether the rule means clock time or duration before converting thresholds. When the workbook stores duration-like HHMM fields, document the assumption.

## Review Boundaries

Do not force automatic conversion when the row needs external knowledge or ambiguous interpretation. Leave `條件` blank or add a review note outside the Excel sheet if:

- The description references real-world mappings not present in Excel, such as income-category monetary thresholds.
- The rule requires duplicate detection across records, such as phone or Email uniqueness.
- The rule requires string validation, such as Email domain validity, unless a project-approved regex/list is available.
- The row references deleted, missing, or renamed variables.
- The description uses broad natural language without a precise threshold or option code.

## SPSS Output Pattern

For each usable row in `檢核項目清單`, generate one SPSS block:

```spss
* <source id or question ids> <short description>.
do if <條件>.
compute m<m>=concat("<listed var string>").
compute p<p>="<problem message>".
end if.
exec.
```

The `<listed var string>` should include every variable in `變項名稱` plus any variables in `額外列出變項`. Check normal variables against the `all` sheet for type and width before rendering. Generated aggregate variables such as `sumE5_E12_min` must be computed before they are listed. Use the project’s existing SPSS message formatting helpers or patterns when available; do not invent a separate output style if logic-group syntax generation already establishes one.

## User Guidance

Ask the user to keep the Word table stable:

- Keep one logical check per row whenever possible.
- Use actual Excel/SPSS variable names in `變項名稱`.
- Put deleted or obsolete rules in `備註` with clear text such as `刪除`.
- Put extra reporting requirements in `備註`, such as `列出E5-E12`.
- Split phone, Email, duplicate, or domain-list checks into separate rows if they require different syntax strategies.

When discussing implementation, recommend using `檢核項目清單` as a reviewable intermediate layer rather than generating final SPSS directly from the Word file.
