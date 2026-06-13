# Numeric Range Worklog - 傳播4-1

## 2026-06-13 r1-r4 fill

Input files:
- Workbook: `傳播4-1/檢核程式套印-傳播4-1.xlsx`
- Questionnaire: `傳播4-1/2026年臺灣傳播調查資料庫正式調查問卷.docx`

Applied date setting:
- Start: `2026/6/15`
- End: `2026/9/15`
- Written value for width-14 date variables: `20260615000000,20260915000000`

Generated files:
- Proposal CSV: `傳播4-1/generated/numeric_range_proposals_final.csv`
- Remaining review CSV: `傳播4-1/generated/numeric_range_review_remaining_final.csv`
- Fill report: `傳播4-1/generated/numeric_range_fill_report_final.json`
- Excel precheck report: `傳播4-1/generated/excel_precheck_after_numeric_fill_final_report.json`
- Excel precheck CSV: `傳播4-1/generated/excel_precheck_after_numeric_fill_final.csv`
- Backup before numeric fill: `傳播4-1/generated/檢核程式套印-傳播4-1.before_numeric_fill.xlsx`

Automation result:
- High-confidence rows applied or matched: 764
- Remaining manual rows: 43
- No unresolved `mismatch` or `range_match_special_diff` rows remained in the final proposal file.

Rules applied:
- Width `14` numeric variables are treated as date/time variables and receive the configured date range.
- Variable names containing `city` receive `1,29`.
- Variables ending with `town` receive the code list from `特殊變項範圍`.
- Multiple-response variables receive `0,1`; non-zero-padded `m` suffix variables also receive `96`.
- Explicit questionnaire ranges are split into `r1-r4`; normal continuous range goes to `r1`, special codes go to later `r` fields.
- Single values do not need duplicated `x,x`; they are written as a single value.
- Hour/minute split variables receive:
  - `g1`: `0,140`, `997`, `998`
  - `g2`: `0,59`, `97`, `98`
- Lowercase `g1/g2` suffix is removed only as a split-field suffix, so variables such as `vKIG1` are not mistaken for hour/minute split variables.

Remaining manual categories:
- Display/check/system-like questions: `vZA`, `vCKB5`
- Card references where the Word file references a card but does not include card option values in paragraphs or tables: `vN1sN1-vN1sN5`, `vN11sN11-vN11sN16`, `vN18sN18-vN18sN20`, `vN21sN21-vN21sN22`, `vN33sN33-vN33sN34`, `vN35sN35-vN35sN38`, `vQ32sQ32-vQ32sQ34`, `vQ58s58-vQ58s61`
- No explicit numeric range/code found in the matched question block: `vO1`, `vO2`, `vO3`, `vO4`, `vN6sN6-vN6sN10`, `vO5`, `vQ28`, `vQ49`

## 2026-06-13 table-following question fix

User clarified that several scale/card questions put the shared option labels in the table immediately after the question paragraph, and child question text appears inside the table.

Added a cleaner parser:
- `淨零/tools/fill_numeric_ranges_from_docx_v2.py`

The parser now:
- Preserves the original paragraph/table order from Word XML.
- Merges the immediate following table into the question block.
- Indexes child question ids found in the table, for example `N1` table rows `N1` through `N10`.
- Treats table headers such as `(97) 不知道` and `(98) 拒答` as valid special codes even when the response cells only show empty boxes.
- Keeps lowercase suffix questions such as `Q28a` separate from their display/intro parent `Q28`.
- Avoids stripping uppercase `O1` as if it were an open-field suffix.

Applied a conservative write-back only to rows that were blank after the previous numeric fill:
- Written: 40 rows
- Backup before table fill: `傳播4-1/generated/檢核程式套印-傳播4-1.before_numeric_table_fill_v2.xlsx`
- Remaining review CSV: `傳播4-1/generated/numeric_range_review_remaining_after_table_fill.csv`

After this pass, blank `r1-r4` rows:
- `vZA`: no questionnaire block matched; likely system/display variable.
- `vCKB5`: check/display question, no response range.
- `vQ28`: intro/display question. The actual numeric question is `Q28a`; do not fill `vQ28` from `Q28a`.

Excel precheck notes:
- `p` and `range` contain formulas. Because the workbook was written by openpyxl, cached formula results are blank until Excel recalculates the file. The validator currently reports those as blank cells when using `data_only=True`.
- The existing `range` formula checks the text `¼Æ­È`, which appears to be mojibake for `數值`. This should be reviewed before relying on formula-generated `range` strings.
- Some `range` cells are blank for rows where no formula existed before fill, for example `vQ26Ag1/g2`. Future Excel-to-SPSS generation should prefer direct `valid_expr` generation from structured fields instead of relying on these formula cells.
- Precheck still reports duplicated global `m` ids across numeric/multiple-response sheets. This may be intentional in the current workbook layout or may need an m/p allocation policy before final combined `.sps` generation.
