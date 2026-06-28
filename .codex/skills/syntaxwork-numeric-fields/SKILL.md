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
- Questionnaire question ids may contain underscores. Treat ids as letters/digits/underscores, for example `ZA0_1`, `P5_1`, and `E3_1`.
- Match Excel `var` to the questionnaire question id by either exact id or exact id with a leading lowercase `v`; strip known suffixes such as multiple-response `m##`, time/group `g#`, and open-field `o##` only when those suffixes are variable decorations rather than part of the questionnaire id.
- For a fixed single value such as `1,1`, write `1`.
- `vA3` should be filled as `r1=1,21` and `r2=97,98`.
- `r1-r4` describe values that may appear in the target variable itself. Values mentioned only inside skip/display logic for another controlling variable must not be copied into the target variable range. Example: in `A2 ... 【A1答(997)或(998)者,才需回答此題】`, `997` and `998` belong to `A1`, not `vA2`.
- If the target question is conditional or may be skipped, include the width-based skip code in `r1-r4` as an allowed value for the target variable. Example: width 3 uses `996`; width 5 uses `99996`.
- For CK check questions: when the question id contains `CK`, the questionnaire marks `【檢查題】`, there is only one option, and the wording contains both `互斥無法點選` and `請重新確認`, fill `r1` with the width-based skip code after confirming the variable is numeric in `all` (`96` for width 2, `996` for width 3, etc.).
- For grouped/table scale questions, include the table immediately following the question paragraph when inferring ranges. If the wording contains `【群組題】` or `請用群組題方式排版`, treat the table rows as subquestions and infer option codes from both `(97)` style headers and `1□` style row cells.
- Special-code columns are not fixed; `r1-r4` may contain normal ranges or special-code ranges in numeric order.
- Special-code magnitude depends on requiredness and the variable width from `all`/Excel: width 2 uses `96`, width 3 uses `996`, width 4 uses `9996`, width 5 uses `99996`, and so on when the questionnaire logic requires missing/special validation.
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

## 2026-06-26 Rule Update

- When applying inferred numeric ranges, verify the `range` column contains the standard Excel formula that builds the SPSS validity expression from `in_or_not`, `var`, `r1-r4`, and decimal rules. Fill or repair the formula when it is blank or different.
