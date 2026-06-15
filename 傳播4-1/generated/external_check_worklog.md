# External Check Items Worklog - 傳播4-1

## 2026-06-14 Word table import

Input:
- `傳播4-1/傳播調查資料庫第四期第一次正式_資料檢核項目0605.docx`
- `傳播4-1/檢核程式套印-傳播4-1.xlsx`

Skill:
- `.codex/skills/syntaxwork-external-checks/SKILL.md`

Workbook update:
- Added/rewrote sheet `檢核項目清單`.
- Columns: `m`, `p`, `題號`, `變項名稱`, `檢核說明`, `備註`, `條件`, `額外列出變項`.
- `m` and `p` intentionally remain blank for user assignment.
- Rows marked `刪除` are excluded during import.
- `題號`, `變項名稱`, and `額外列出變項` use comma-separated values, not `|`.

Generated files:
- `傳播4-1/generated/external_check_item_proposals.csv`
- `傳播4-1/generated/external_check_item_import_report.json`
- `傳播4-1/generated/external_check_syntax_generated.sps`
- `傳播4-1/generated/external_check_syntax_report.json`
- `傳播4-1/generated/external_check_worklog.md`
- Backup: `傳播4-1/generated/檢核程式套印-傳播4-1.before_external_checks.xlsx`

Import result:
- Total imported rows: 42
- Auto condition proposals: 37
- Review/blank condition rows: 5
- Deleted rows excluded from import: 27

Extra output variable handling:
- For notes such as `列出E5~E12加總合計時數`, the tool checks `all` sheet metadata before creating aggregate variables.
- `vE5`, `vE6`, `vE8`, `vE9`, `vE11`, and `vE12` are numeric width-5 time fields and are included.
- `vE7` and `vE10` are numeric width-4 fields and are excluded from the HHMM time aggregate.
- Generated aggregate variables:
  - `sumE5_E12_min`: all compatible E5-E12 time fields in minutes.
  - `sum<rule_vars>_min`: the current check-item variables in minutes, such as `sumE5_E8_E11_min`.

Review/blank condition classes:
- `E5 | E6 | D3`: needs a stable rule for "sum exceeds another HHMM duration by 2 hours".
- `E14`: needs an income-category to monetary-threshold mapping for O5.
- `Z2_1`, `Z2_2 | ZE2_1`, `ZE2_3`: phone/email length, duplicate, domain, or special-character validation need dedicated string/duplicate rules.

SPSS generation:
- Tool: `淨零/tools/generate_external_check_spss.py`
- Current generated rule count: 0, because all `m` and `p` cells are blank by design.
- When `m/p` are filled, generated aggregate variables in `額外列出變項` are computed before the `do if` block and then included in the `m` message.
- The generated `.sps` currently contains only:
  - `* SYNTAXWORK_BEGIN_EXTERNAL_CHECKS.`
  - `* SYNTAXWORK_END_EXTERNAL_CHECKS.`

Validation notes:
- Skill validation passed after installing `PyYAML` into `.codex/vendor/pyyaml` and running `quick_validate.py` with `PYTHONPATH` set to that directory.
- Existing workbook still reports duplicate `m301-m306` across numeric/multiple-response sheets. This is pre-existing and not caused by `檢核項目清單`.
