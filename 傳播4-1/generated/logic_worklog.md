# 傳播4-1邏輯組工作紀錄

## 目前狀態

- Word: `2026年臺灣傳播調查資料庫正式調查問卷.docx`
- Excel: `檢核程式套印-傳播4-1.xlsx`
- 已建立抽取報告:
  - `generated/logic_cues_from_word.csv`
  - `generated/logic_cues_from_word_report.json`
  - `generated/excel_precheck.csv`
  - `generated/excel_precheck_report.json`

## 小批量分析結果

- Word 共抽到 237 個括號邏輯線索。
- 初步分類:
  - `candidate:show`: 17
  - `candidate:skip`: 1
  - `review:condition`: 217
  - `ignore:show`: 2
- Excel `邏輯組` 目前有 314 個預留 m/p row，條件/應答/不應答欄皆空。

## 會影響後續寫入的問題

- `邏輯組` 目前只有 5 欄: `m`, `p`, `條件`, `應答`, `不應答`。
- 目前缺少 `限制` 欄。
- Word 中有大量規則屬於限制型，不適合寫入 `應答/不應答`:
  - `選項互斥`
  - `選項必選`
  - `與 D1 答(03)互斥`
  - 檢查題比較式，例如 `B1+B3+1<B5顯示此題`
- 若不新增或定義限制欄位，這些規則只能留空或寫入人工 review，不能穩定產生 SPSS。

## 下一步待確認

- 是否允許在 `邏輯組` 新增第 6 欄 `限制`。
- 對限制型規則的 Excel 表達方式是否沿用既有工具格式，例如:
  - `var in 1,2,3`
  - `var not in 1,2,3`
  - `var <= rhs`
  - `var ~= rhs`
- `互斥/必選` 是否要歸入邏輯組限制，或仍交給複選題模組處理。

## 2026-06-13 update

- User approved adding the `限制` column.
- Added `限制` as column F in `邏輯組`.
- Generated `generated/logic_group_proposals.csv`.
- Applied 110 high-confidence answer/show-hide logic rows to `邏輯組`.
- Left 125 rows as review/manual because they involve restrictions, comparisons, pasted answer text, or compound expressions.
- Created workbook backup: `generated/檢核程式套印-傳播4-1.before_logic_fill.xlsx`.
- Generated syntax preview: `generated/logic_checks_generated.sps`.
- Static check passed:
  - logic do if: 110
  - compute m: 110
  - compute p: 110
  - m/p ids: 1701-1810

## Remaining review categories

- Restriction/check/display-specific handling: 51
- Pasted answer text such as `貼D2答案`, `貼O1答案`, `貼H7答案`.
- Compound conditions such as `E5+E6=0`, `E11+E12=0`, `B1及B3皆答0`.
- Multi-question all-none conditions such as `G7和G8和G9和G10和G11皆答(90)`.
- Some target qids are not directly found in `all`, such as `Q21`, `Q24`, `Q26A`.
