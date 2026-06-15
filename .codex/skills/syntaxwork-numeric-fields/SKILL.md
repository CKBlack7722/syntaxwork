---
name: syntaxwork-numeric-fields
description: Fill and validate Syntaxwork numeric-field Excel sheets from questionnaire Word files. Use when Codex needs to infer r1-r4 ranges, special codes, decimal rules, date ranges, city ranges, or numeric SPSS-validity fields from .docx questionnaires into project workbooks.
---

# Syntaxwork Numeric Fields

## Core Workflow

Use this skill for numeric question fields in the questionnaire -> Excel step.

1. Read `all` for variable type and width.
2. Parse numeric ranges and special codes from question text and following tables.
3. Fill every numeric variable after questionnaire first question, even when `r1-r4` must remain blank for review.
4. Sort `r1-r4` by numeric order from small to large.
5. Put continuous ranges in one cell as `start,end`; put single values as one value.
6. If adjacent `r1-r4` cells are consecutive singleton values, merge them into one range cell, for example `r2=997` and `r3=998` becomes `r2=997,998`.

## Required Rules

- `city` numeric variables use range `1,29`.
- For a fixed single value such as `1,1`, write `1`.
- `vA3` should be filled as `r1=1,21` and `r2=97,98`.
- For CK check questions: when the question id contains `CK`, the questionnaire marks `【檢查題】`, there is only one option, and the wording contains both `互斥無法點選` and `請重新確認`, fill `r1` with the width-based skip code after confirming the variable is numeric in `all` (`96` for width 2, `996` for width 3, etc.).
- For grouped/table scale questions, include the table immediately following the question paragraph when inferring ranges. If the wording contains `【群組題】` or `請用群組題方式排版`, treat the table rows as subquestions and infer option codes from both `(97)` style headers and `1□` style row cells.
- Special-code columns are not fixed; `r1-r4` may contain normal ranges or special-code ranges in numeric order.
- Special-code magnitude depends on requiredness and value width: one-digit ranges use `96`, two-digit ranges use `996`, three-digit ranges use `9996`, and so on when the questionnaire logic requires missing/special validation.
- Date fields are numeric width `14`; final apps should ask users for start/end dates and default missing time parts to `000000`.
- Four-digit time fields must reject impossible minutes: the third digit cannot be `6`, `7`, `8`, or `9`.

## Decimal Rules

If decimals are allowed, fill the decimal-rule column with an SPSS-compatible expression or note. For half-step values such as `0.5,1,1.5`, use a `mod(var*10,5)=0` style rule and combine with range checks.

## Validation

Report rows where:

- no numeric range is found
- a table is needed to infer the range
- special codes conflict with requiredness
- decimal rules are ambiguous
- variables in Excel are absent from `all`
