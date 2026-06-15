# Multi-response Worklog - 傳播4-1

## 2026-06-14 Questionnaire to Excel fill

Input:
- `傳播4-1/2026年臺灣傳播調查資料庫正式調查問卷.docx`
- `傳播4-1/檢核程式套印-傳播4-1.xlsx`

Tool:
- `淨零/tools/fill_multi_sheets_from_docx.py`

Result:
- `複選題變項清單` was treated as the user-provided authoritative variable list.
- The tool compared each grouped variable list against questionnaire option codes.
- Questionnaire-only `97` and `98` are ignored for this comparison because they are not expanded multiple-response variables in the current Excel list.
- Main multiple-response proposals: 35 groups, all matched.
- Internal mutex proposals: 7 stable range-based rules, all matched.
- Workbook backup before applying: `傳播4-1/generated/檢核程式套印-傳播4-1.before_multi_fill.xlsx`.

Generated review files:
- `傳播4-1/generated/multi_sheet_fill_proposals.csv`
- `傳播4-1/generated/multi_mutex_fill_proposals.csv`
- `傳播4-1/generated/multi_sheet_fill_report.json`

## 2026-06-14 Excel to SPSS follow-up check

Tool:
- `淨零/tools/generate_multi_checks.py`

Generator changes:
- Infer `複選題變項清單` groups from variable names when Excel formula cache is stale.
- Fall back to `m` when `p` is blank or formula cache is unavailable.
- Skip stale rows that have `m` but no question id.

Current generated SPSS:
- `傳播4-1/generated/multi_checks_generated.sps`

Current generation result:
- 30 main multi-response checks emitted.
- 4 internal mutex checks emitted.
- Not emitted yet because `m/p` are intentionally blank in the main sheet: `vQ26`, `vQ27`, `vQ30`, `vQ31`, `vZE2`.
- Mutex rows for `vQ30`, `vQ31`, and `vZE2` are filled in Excel but not emitted until their main-sheet rows receive `m/p`.
