# Survey-to-Excel Skill Fix Worklog - 傳播4-1

## 2026-06-14 skill split

Created and validated five project-local skills:

- `.codex/skills/syntaxwork-logic-groups`
- `.codex/skills/syntaxwork-multi-response`
- `.codex/skills/syntaxwork-numeric-fields`
- `.codex/skills/syntaxwork-open-fields`
- `.codex/skills/syntaxwork-check-items`

All `syntaxwork-*` skills currently pass `quick_validate.py`.

## 2026-06-14 workbook fixes

Applied fixes to `傳播4-1/檢核程式套印-傳播4-1.xlsx`.

Numeric fields:
- `vA3` is now `r1=1,21` and `r2=97,98`.
- Numeric proposal ordering now sorts `r1-r4` by numeric value.
- Continuous special-code ranges can be represented in one cell, such as `97,98`.

Multiple response:
- `複選題1101` is now accepted as the main multiple-response sheet.
- Filled `題號` values without leading `v`, for example `K1`, `K2`, `KFB3`.
- Multiple-response SPSS generation now reads 35 main checks and 7 internal mutex checks with zero issues.

Open fields:
- Filled `是否複選` from `複選題變項清單` instead of relying on Word parsing.
- Examples fixed: `vK1o88=1`, `vK2o88=1`, while `vA3o88=0`.
- Confirmed formula-dependent columns are required by downstream syntax design: `題號`, `題號變項名稱`, `選項數值`, `var2_new`, `range_new`, `n`.
- Formula columns were preserved; no formula blanks were found during the formula-fill pass.

Logic groups:
- Added 4-digit HHMM minute-tens restrictions for numeric time fields with range `1,2359`.
- Rule syntax in Excel: `<var> minute_tens in 0,1,2,3,4,5`.
- Generated SPSS form: `not any(mod(trunc(<var>/10),10),0,1,2,3,4,5)`.
- Added 18 time-field limit rows, including `vG2`, `vKIG2`, `vD3`, `vC2`.

## Verification

Generated files:

- `傳播4-1/generated/numeric_range_proposals_after_skill_fix.csv`
- `傳播4-1/generated/multi_checks_after_skill_fix.sps`
- `傳播4-1/generated/multi_checks_after_skill_fix_report.json`
- `傳播4-1/generated/logic_checks_after_skill_fix.sps`
- `傳播4-1/generated/logic_checks_after_skill_fix_report.txt`
- `傳播4-1/generated/open_field_formula_fill_report.json`
- `傳播4-1/generated/excel_precheck_after_skill_fix.csv`
- `傳播4-1/generated/excel_precheck_after_skill_fix_report.json`

Verification results:
- Skill validation: passed.
- Multiple response: 35 questions, 7 mutex rules, 0 issues.
- Logic generation: 128 rules; 18 unresolved normalization notes correspond to the new `minute_tens` Excel syntax, but SPSS is generated correctly.
- Excel precheck: 0 errors, 5 warnings.

Remaining warnings / manual review:
- `vA5town r1` is a long explicit township-code list; precheck flags the format as non-standard, but this appears intentional.
- `vE3_1` width is 6000 in `all` and `開放欄位`; not automatically changed to 150.
- `vZE2_1`, `vZE2_2` width is 30 in `all` and `開放欄位`; not automatically changed to 150.
- `vZE2_3` width is 900 in `all` and `開放欄位`; not automatically changed to 150.
- Open-field Word parsing still has low coverage for full questionnaire comparison: 27 question blocks, 47 proposed rows, 54 existing rows not found in parsed Word, and 3 mismatches (`vQ22o88`, `vQ27o88`, `vQ51o88`). This should be improved before claiming full Word-to-open-field completeness.
