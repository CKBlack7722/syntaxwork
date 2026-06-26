# SPSS Survey Syntax Automation Project Notes

本專案目標是把問卷檢核流程整理成可搬移、可重跑的自動化工作流。主要資料夾如下：

- `淨零`: 淨零與能源安全問卷、Excel 套印檔、既有 SPSS 語法與工具程式。
- `消費者`: 原始台灣消費者第一期問卷、Excel 套印檔、既有 SPSS 語法與測試資料。
- `消費者2`: 新版台灣消費者問卷與 Excel 套印檔，目前主要用來驗證邏輯組流程。

## 已完成流程

### 1. 邏輯組 Excel 轉 SPSS

工具位置：

```text
淨零/tools/generate_logic_checks.py
淨零/tools/static_check_generated_logic.py
```

目前支援從 Excel 的 `邏輯組` sheet 產生 `**LOGIC GROUP CHECKS.` 區塊。

`邏輯組` 欄位定義：

```text
m
p
條件
應答
不應答
限制
```

重要規則：

- `m` / `p` 使用 Excel `邏輯組` sheet 定義的編號。
- 如果 `p` 是公式但讀不到快取值，程式會用 `m` 當 fallback，避免產出 `pNone`。
- `條件`、`應答`、`不應答`、`限制` 中出現的變項名稱會先對照 `all` sheet。
- 若變項不在 `all`，會嘗試在前面補小寫 `v`。
- 補上 `v` 後若存在於 `all`，會直接修正並覆蓋 Excel。
- 補上 `v` 後仍不存在於 `all`，視為 unresolved，不處理。
- 不產生 `_96` 前置處理；這部分由使用者在完整 SPSS 流程中一次處理所有變項。
- 註解格式使用變項題號，不使用 m/p 編號，例如：

```spss
* logic check show vA0.
* logic check hide vA0.
* logic check limit vB1D.
```

目前 `限制` 欄位支援：

```text
var not in 1,2,3
var in 1,2,3
var <= rhs
var < rhs
var >= rhs
var > rhs
var = rhs
var ~= rhs
```

`條件` 欄位可以空白。空白時，限制本身就是全體樣本都應符合的條件。

範例：

```spss
do if any(vB1,2).
do if vB1>vA1.
```

### 2. 消費者2 驗證狀態

最近一次人工確認通過：

```text
消費者2/generated/logic_checks_generated.sps
```

最近一次產生結果：

```text
rules: 85
logic sheet corrections: 0
logic sheet unresolved: 0
STATIC CHECK PASSED
logic do if: 85
compute m: 85
compute p: 85
m/p ids: 301-385
```

目前沒有使用 SPSS 自動測試；使用者希望先人工檢查語法。

## 複選題下一階段規劃

目前既有 `.sps` 的複選題模式不是 SPSS `MRSETS`，而是把每個選項展成一個 0/1/96 變項。

例：

```text
v45m01 to v45m07
v46m01 to v46m07
v48m01 to v48m07
vQ24m1 to vQ24m6
```

既有 SPSS 模板分成兩段：

1. `**3.複選題檢核.`
   - 建立 A600 字串，把整題所有選項值串起來。
   - 檢查至少選一項。
   - 檢查 0/1 與 96 跳答碼是否在同一題內一致。

2. `**3.1複選互斥邏輯.`
   - 檢查互斥選項不可和其他選項同時被選。

建議下一支工具：

```text
淨零/tools/generate_multi_checks.py
```

目前已建立第一版工具：

```text
淨零/tools/generate_multi_checks.py
```

已試跑：

```text
淨零/generated/multi_checks_generated.sps
淨零/generated/multi_checks_report.json
消費者/generated/multi_checks_generated.sps
消費者/generated/multi_checks_report.json
消費者2/generated/multi_checks_generated.sps
消費者2/generated/multi_checks_report.json
```

目前結果：

- `淨零`: 產生 3 組複選題檢核、3 組互斥檢核，無 warning。
- `消費者`: 產生 1 組複選題檢核、1 組互斥檢核，無 warning。
- `消費者2`: 尚不能完整產生；缺 `複選題_301-400` sheet，且 `複選題內_互斥` 的 `F2` 對不到 `複選題變項清單` 內的 `vF1m...` 分組。

第一版工具與既有語法的差異：

- 舊版淨零語法的顯示字串只列 `v45m01` 到 `v45m06`，但檢核實際使用 `v45m01` 到 `v45m07`。
- 新工具會在顯示字串列出整組複選變項，例如 `v45m01` 到 `v45m07`，方便人工查錯。
- 檢核條件本身維持功能等價。

建議資料來源：

- `複選題_301-400`: 定義 m/p、題號、選項範圍、特殊碼、互斥選項。
- `複選題變項清單`: 作為實際變項清單來源。
- `複選題內_互斥`: 定義互斥選項與被互斥的其他選項範圍。

設計重點：

- 不要只用 `題號 + 寬度 + 起迄` 推算變項名稱。
- 淨零的命名可推算，例如 `v45m01`。
- 消費者的命名不可直接推算，例如 Excel 題號是 `Q24`，實際變項是 `vQ24m1`。
- 因此應以 `複選題變項清單` 為主，依 `分組` 找出同一題的全部選項變項。

Excel 建議改善欄位：

```text
複選題_301-400
m
p
題號
顯示名稱
全部無反應碼
互斥選項
是否檢查至少一項
是否檢查96一致
```

其中 `顯示名稱` 可用於錯誤訊息，例如 `Q24`；實際處理變項仍以 `複選題變項清單` 為準。

### 3. 複選題工具目前狀態

新增工具：

```text
淨零/tools/generate_multi_checks.py
淨零/tools/build_spss_checks.py
```

`generate_multi_checks.py` 只產生 `**3.複選題檢核.` 與 `**3.1複選互斥邏輯.` 區塊。設計原則是：

- 實際 SPSS 變項一律以 `複選題變項清單` 為準，不用 `題號 + m + 編號` 猜測。
- `複選題_...` 工作表提供 m/p、顯示題號、無反應碼、是否檢查至少一項、是否檢查 96 一致。
- `複選題內_互斥` 工作表提供互斥選項與其他選項範圍。
- `加總程式`、`程式1` 等舊公式欄目前只作為人工參考；若與實際變項清單不一致，產生器會在 report 裡警告但不採用。

`build_spss_checks.py` 會把已確認的分段輸出合併成單一 `.sps`。目前已可合併：

```text
邏輯組
複選題
```

未來處理數值題、開放欄位時，建議也先各自產生單一區塊並通過人工比對，再用 `build_spss_checks.py` 加到同一個最終 `.sps`。

目前產出檔：

```text
消費者2/generated/multi_checks_generated.sps
消費者2/generated/all_checks_generated.sps
淨零/generated/multi_checks_generated.sps
淨零/generated/all_checks_generated.sps
```

目前 Excel 填寫注意事項：

- `消費者2` 的 `複選題內_互斥` 第 2 列 `互斥選項` 填 `100`，但實際變項是 `vF2m10`，建議改成 `10`。
- `淨零` 的 `複選題_301-400` 加總程式仍寫成 `v45m1 to v45m7` 等，但實際變項是 `v45m01 to v45m07`；此欄可改正或留空，產生器不依賴它。
- `淨零` 的 `複選題內_互斥` 第 4 列題號填 `47`，但實際應是 `48`，否則無法產生 `v48` 的互斥檢核。

### 4. 數值題 r1-r4 建議值工具目前狀態

新增工具：

```text
淨零/tools/generate_numeric_range_proposals.py
淨零/tools/compare_questionnaire_completeness.py
```

目前先產生建議值與比對報告，不直接覆蓋 Excel：

```text
generated/numeric_range_proposals_all_projects.xlsx
generated/numeric_range_mismatch_review.csv
消費者/generated/numeric_range_proposals.csv
消費者2/generated/numeric_range_proposals.csv
淨零/generated/numeric_range_proposals.csv
```

目前穩定規則：

- Word 題文有 `範圍設定 x-y` 時，推 `r1=x,y`。
- Word 題文有 `填答範圍設定大於等於 x` 時，推 `r1=x,999999999`。
- 選項題用 `(01)...(05)` 推選項範圍。
- 數值不變時用單一值，例如 `1`，不用 `1,1`。
- 變項名稱包含 `city` 的數值變項先統一推 `r1=1,29`。
- `複選題變項清單` 中的展開變項推 `r1=0,1`；消費者/消費者2 的非補零 m1 格式另推 `r2=96`，淨零 m01 格式目前不推 `96`。
- 消費者類增加/減少金額題推 `r2=9999999996`。
- 非必答題若可推定有效值範圍，依有效值最大位數推 special code，例如個位數 -> `96`、兩位數 -> `996`、三位數 -> `9996`，並放在 r1-r4 下一個空欄。
- 日期欄若 13 位且像西元年月日時分秒，補成 14 位；例如消費者2 `2026062900000` -> `20260629000000`。

目前仍需人工或規則決策：

- Word 選項包含特殊選項，但 Excel 將特殊選項放在 r2/r3，而非納入 r1，例如 `D1`、`Q25`。
- Word 明確範圍與 Excel 既有規則不同，例如 `CKQ4` 題文寫大於等於 1，但 Excel 既有是 `0,999999999`。
- 系統日期、END 題、行政區碼、父題衍生題仍留空或人工判定。

## 常用指令

產生消費者2邏輯組語法：

```powershell
& 'C:\Users\choco\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' 'Z:\AIWork\syntax\淨零\tools\generate_logic_checks.py' --workbook 'Z:\AIWork\syntax\消費者2\檢核程式套印-台灣消費者2.xlsx' --output 'Z:\AIWork\syntax\消費者2\generated\logic_checks_generated.sps' --report 'Z:\AIWork\syntax\消費者2\generated\logic_checks_report.txt'
```

靜態檢查：

```powershell
& 'C:\Users\choco\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' 'Z:\AIWork\syntax\淨零\tools\static_check_generated_logic.py' --syntax 'Z:\AIWork\syntax\消費者2\generated\logic_checks_generated.sps'
```

注意：換電腦後 Python 路徑可能不同。最穩定做法是請 Codex 先讀取這份 notes，再使用該電腦可用的 Python 執行同一支工具。

## 換電腦作業方式

建議使用 Git 管理整個資料夾：

```powershell
git status
git add .
git commit -m "Update SPSS syntax workflow"
git push
```

另一台電腦：

```powershell
git pull
```

如果尚未設定遠端 repository，至少可以先把整個資料夾打包搬移。換電腦後，請新的 Codex 先讀：

```text
PROJECT_NOTES.md
```

## 2026-06-13 loop engineering pipeline run

本輪目標：以 `消費者`、`消費者2`、`淨零` 為基底，建立可重跑的問卷檢核產線，先用現有 Excel + Word + 既有 SPSS 語法比對，逐段產出邏輯組、複選題、數值題 r1-r4 提案，最後把已完成的語法 section 合併成單一 `.sps`。

新增/調整工具：

```text
淨零/tools/run_survey_check_pipeline.py
淨零/tools/generate_logic_checks.py
```

本輪修正：

- `generate_logic_checks.py` 讀取 `邏輯組` 時，若 Excel 某列少於 6 欄，改成自動補空欄，避免因空白尾欄中斷整個專案。
- `run_survey_check_pipeline.py` 串接三個資料夾流程，並在每個子步驟設定 timeout。若某個 section 失敗，不會把不存在的 `.sps` 放入合併清單。
- `run_survey_check_pipeline.py` 已把既有 SPSS 語法檔傳給邏輯組工具，讓邏輯組也能做實際語法比對。
- pipeline 目前仍不改動問卷 Word 本身；Word 無法判定的項目先記錄到 review CSV。

本輪輸出：

```text
generated/pipeline_run_report.json
generated/questionnaire_completeness_report.csv
generated/questionnaire_completeness_report.json
generated/numeric_range_mismatch_review.csv
消費者/generated/all_checks_generated.sps
消費者2/generated/all_checks_generated.sps
淨零/generated/all_checks_generated.sps
```

三個資料夾皆已成功產生單一合併 `.sps`。目前合併內容只包含已完成的邏輯組與複選題 section；數值題與開放欄位仍先做資料填寫/比對，尚未正式轉成 SPSS section。

數值題 r1-r4 本輪比對摘要：

- `消費者`：59 列，match 34、manual 8、mismatch 7、range_match_special_diff 10。
- `消費者2`：94 列，match 61、manual 15、mismatch 6、range_match_special_diff 12。
- `淨零`：123 列，match 104、manual 14、mismatch 1、range_match_special_diff 4。

需要使用者裁決的主要 mismatch：

- `消費者 vCKQ4`：Word 明寫大於等於 1，Excel 目前為 `0,999999999`。需確認 CK/併回題是否允許 0，或應依 Word 改為 `1,999999999` 加特殊碼。
- `消費者 vQ17_1/vQ17_1A/vQ17_2A/vQ20_1/vQ20_2/vQ25`：Word 選項範圍與 Excel 把部分值排除或放 special code 的做法不同。
- `消費者2 vEND1/vEND3`：Excel 日期上限少一個 0，工具已提案補為 14 位時間戳。使用者已確認 `vEND1` 是填寫錯誤，`vEND3` 建議同規則檢查。
- `消費者2 vA0`：Excel 看起來像日期範圍，Word 對應到單一選項值 `1`，需確認變項用途或 Excel 是否放錯。
- `消費者2 vC1U/vC1D/vD1`：Word 選項與 Excel special code 拆分不同，需人工確認哪些選項是有效值、哪些是特殊碼。
- `淨零 v42`：Word 出現 `(00)`，工具提案 `0,6`；Excel 目前為 `1,6`，需確認 0 是否為有效答案。

目前 manual 類型主要分三種：

- END 題時間戳：需要專案正式訪問期間規則，才能自動填範圍。
- 題號衍生變項沒有直接問卷 block：例如 `C1U4R`、`33_1` 等，需建立 parent-question mapping 規則。
- 行政區/鄉鎮代碼：例如 `vZ1town/vZ2town/vZ3town`，需要專案代碼表。

下一步建議：

1. 先由使用者裁決上述 mismatch，尤其是 Word 明寫範圍但 Excel 另有例外的題目。
2. 把 END 日期規則、parent-question mapping、行政區代碼表做成可設定規則。
3. 再進入數值題 SPSS section 生成，最後和現有 `all_checks_generated.sps` 合併成完整單一檔。

再繼續下一階段。

## 2026-06-13 follow-up: date range and logic markers

使用者已修正：

- `消費者 vCKQ4` Excel 範圍。
- `消費者2` 日期上限補 0。
- `消費者2 vA0`。
- `淨零 v42`。
- `淨零` 複選題既有語法。

本輪工具調整：

- `generate_numeric_range_proposals.py` 新增寬度 14 日期時間規則：只要 Excel `all` sheet 內是數值型、寬度為 14，即視為日期時間範圍欄位，不再只靠 `END` 變項名稱判斷。
- `generate_numeric_range_proposals.py` 新增 `--date-start` / `--date-end`。支援 `YYYYMMDD`、`YYYY-MM-DD`、`YYYYMMDDHHMMSS`；未填時分秒會補 `000000`。例：`2026-06-09` -> `20260609000000`。
- `run_survey_check_pipeline.py` 同步支援 `--date-start` / `--date-end`，未傳入時維持使用 Excel 既有 r1 進行比對。
- `generate_logic_checks.py` 產出的邏輯組 section 加入機器標記：
  - `* SYNTAXWORK_BEGIN_LOGIC.`
  - `* SYNTAXWORK_END_LOGIC.`
- 既有 SPSS 邏輯抽取會優先使用上述 marker；舊檔沒有 marker 時，fallback 使用 `**4.邏輯檢核.` 到下一個段落/分隔線。

本輪驗證：

- 單案小測：`消費者2` 使用 `--date-start 2026-06-09 --date-end 20260629`，`vEND1/vEND2/vEND3` 均產出 `20260609000000,20260629000000`。
- 全量 pipeline 成功，所有 command return code 皆為 0。
- 數值題摘要：
  - `消費者`：59 列，match 37、manual 5、mismatch 6、range_match_special_diff 11。
  - `消費者2`：94 列，match 65、manual 14、mismatch 3、range_match_special_diff 12。
  - `淨零`：123 列，match 112、manual 7、mismatch 0、range_match_special_diff 4。
- 邏輯組：
  - `淨零`：generated 20、existing 20、matched 20、unmatched 0。
  - `消費者2`：generated 85、existing 87、matched 0；此案的既有語法可抽到 `DO IF`，但與 Excel 生成規則尚未對齊，需後續看邏輯組內容/既有語法差異。

剩餘待確認：

- `淨零` 複選題差異：格式差異之外，`複選題內_互斥` 第 4 列目前寫互斥題號 `47`，工具找不到對應複選題分組；既有語法有 `v48=7` 互斥檢核。建議確認 Excel 該列是否應改為 `48`。
- 剩餘數值題 mismatch 皆為 Word 選項範圍與 Excel special code/有效值拆分差異：
  - `消費者 vQ17_1/vQ17_1A/vQ17_2A/vQ20_1/vQ20_2/vQ25`
  - `消費者2 vC1U/vC1D/vD1`
- manual 類型仍集中在 parent-question mapping、無明確範圍的題目，以及行政區/鄉鎮代碼表。

## 2026-06-13 follow-up: open-field Word-to-Excel validation

使用者已修正：

- `淨零` 的 `複選題內_互斥` 第 4 列由 `47` 改為 `48`。
- `消費者2` 既有語法已先手動加入 `SYNTAXWORK_BEGIN_LOGIC` / `SYNTAXWORK_END_LOGIC` marker。

本輪定位：

- `SYNTAXWORK_BEGIN_*` / `SYNTAXWORK_END_*` marker 未來應由最終語法合併程式自動加入各 section。
- 如果使用者手動完成某段 SPSS 語法，只需進行比對，可讓使用者自行加入 marker，程式優先用 marker 抽取比對。
- 開放欄位本階段只做 Word -> Excel 提案/比對，不產生 SPSS 語法。

新增工具：

```text
淨零/tools/generate_open_field_proposals.py
```

工具規則：

- 從 `.docx` 內部 XML 抽取全文，可處理一般段落外的 Word 文字。
- 依問卷題號切成 blocks，支援 `Q17_1A`、`CK17_1A`、`C1U5R`、`71_2` 等複雜題號。
- 自動抓選項文字中的 `請說明`、`請填`、`請註明`、`說明百分比`，以及 `其他/其它 + 底線`。
- 支援未標號但可由跳答標記計算的其他欄位，例如 `v70o10`。
- 支援結構化文字子欄位，例如 `v71_2s1` 到 `v71_2s4`。
- 支援確認題 remap，例如：
  - `vQ17_1Ao2` -> `vCK17_1Ao2`
  - `vC1U5o2` -> `vC1U5Ro2`
- city open field 的 `29` / `ot` 視為專案慣例差異，比對時以既有 Excel var 為準。

pipeline 更新：

- `run_survey_check_pipeline.py` 已加入開放欄位步驟。
- 每個 project 會輸出：

```text
<project>/generated/open_field_proposals.csv
<project>/generated/open_field_proposals_report.json
```

- 全域彙整非 match：

```text
generated/open_field_mismatch_review.csv
```

本輪驗證：

- `消費者`：開放欄位 4/4 match。
- `消費者2`：開放欄位 6/6 match。
- `淨零`：開放欄位 28/28 match。
- `generated/open_field_mismatch_review.csv` 目前 0 筆。
- `淨零` 複選題：Excel 第 4 列改成 `48` 後，工具 issues 已為空，reference/generated 都是 61 行；目前 `normalized_equal=False` 只剩註解文字與換行/空白格式差，非實質規則缺漏。

下一步建議：

1. 強化複選題語法 normalizer，忽略註解文字、換行與空白差異，讓格式差不再被當成內容差。
2. 回到數值題剩餘 mismatch / special code 差異，確認使用者規則後再進 SPSS section 生成。
3. 開始規劃最終合併 `.sps` 的 section marker：`NUMERIC`、`OPEN_FIELD`、`MULTI`、`LOGIC` 等。

## 2026-06-13 follow-up: Excel precheck before conversion

使用者確認方向：

- 目前 Word -> Excel 的邏輯組、複選題、開放欄位在三個基準案已可處理。
- 剩餘主要是數值題 mismatch / special code 差異。
- 在 Excel -> SPSS 前需要前置檢查，避免欄位缺漏、公式錯誤或錯置造成語法生成錯誤。

新增工具：

```text
淨零/tools/validate_excel_structure.py
```

pipeline 更新：

- `run_survey_check_pipeline.py` 已在每個 project 開始處先跑 Excel precheck。
- 目前 precheck 不阻斷後續流程；若有 error，會寫入 report 的 `precheck_summary`，並在 project `unresolved` 記錄 `excel_precheck`。
- 每個 project 會輸出：

```text
<project>/generated/excel_precheck.csv
<project>/generated/excel_precheck_report.json
```

目前檢查項目：

- 必要 sheet 是否存在：`all`、數值題、開放欄位、複選題、複選題內互斥、複選題變項清單；有 `邏輯組` 則檢查邏輯組。
- 必要欄位是否存在。
- `m` 是否為數字、是否重複。
- `var` / `變項名稱` 是否重複。
- 公式錯誤：`#VALUE!`、`#REF!`、`#NAME?`、`#N/A`、`#DIV/0!`。
- 數值題：`變項屬性=數值`、`寬度` 為數字、`r1~r4` 格式。
- 開放欄位：`變項屬性=字串`、`寬度=150`、`是否複選` 為 0/1。
- 複選題：主表題號是否可對到 `複選題變項清單`。
- 邏輯組：必要欄位 `m/p/條件/應答/不應答`；`限制` 目前列為 recommended。

目前三案 precheck 結果：

- `消費者`：0 error / 0 warning。
- `消費者2`：0 error / 0 warning。
- `淨零`：20 error / 4 warning。

淨零 error：

- `開放欄位251-300` 第 21-24 列，也就是 `v71_2s1` 到 `v71_2s4`。
- 這四列的 `題號`、`題號變項名稱`、`選項數值`、`range_new`、`n` 目前為 `#VALUE!`。
- Word -> Excel 比對已能判定這四列並 match，但若未來 Excel -> SPSS 使用這些輔助欄位，建議修正 Excel 公式或改由程式補齊。

淨零 warning：

- `邏輯組` 缺 recommended 欄位 `限制`。目前工具可繼續，但未來若要由 Excel 產生限制類邏輯，建議保留此欄。
- `vZ1town/vZ2town/vZ3town` 的 `r1` 是長代碼清單，格式不屬於簡單 `min,max`；這屬於行政區代碼表，應保留為專案代碼表/清單型檢核。

欄位責任分工暫定：

- 使用者/模板先提供：`all` sheet 的 `變項名稱/變項屬性/寬度`，以及各類 sheet 的基本 `m/p/var` 或題號列。這是像「欄位骨架」。
- 程式可由 Word 自動填/比對：數值題 `r1~r4` 提案、開放欄位列、複選題主表/互斥表、邏輯組基本規則。
- 使用者需判定或提供規則：數值題 special code 是否應存在、必答/非必答、行政區 town code 表、複雜題目 parent mapping、問卷語意無法單靠規則判斷的例外。
- 程式最終生成：各 section SPSS 語法，以及最終合併 `.sps` 的 section marker。

## 2026-06-15 follow-up: survey-to-Excel skills and updated check items

本輪使用者確認：

- 傳播4-1 開放欄位 `vQ22o88`、`vQ27o88`、`vQ51o88` 都是 Word 選項列表/表格中的 `(88)其他/其它,請說明` 類型。
- 開放欄位可用選項內 `其他`、`其它` 搭配 `請說明` 或底線作為基本判斷。
- `vA5town` 長代碼清單正確。
- `vE3_1` 寬度 6000、`vZE2_1/vZE2_2` 寬度 30、`vZE2_3` 寬度 900 正確；寬度以 `all` sheet 為準，不需列入例外規則。

已處理：

- 新增並驗證五個 questionnaire -> Excel 主 skill：
  - `.codex/skills/syntaxwork-logic-groups`
  - `.codex/skills/syntaxwork-multi-response`
  - `.codex/skills/syntaxwork-numeric-fields`
  - `.codex/skills/syntaxwork-open-fields`
  - `.codex/skills/syntaxwork-check-items`
- `syntaxwork-open-fields` 已補上 `其他/其它` 判斷，以及複選開放欄位如 `vQ22o88` 應對到母選項變項 `vQ22m88` 的規則。
- `generate_open_field_proposals.py` 已修正：
  - 若 Excel 公式欄沒有快取值，依 `var` 與 `是否複選` 推導 `題號/選項數值/var2_new/range_new/n` 供比對。
  - 複選開放欄位的 `qvar` 改推為 `v<題號>m<選項值>`。
- 開放欄位重新比對後，指定三筆 `vQ22o88/vQ27o88/vQ51o88` 已從 mismatch 變成 match。
- 更新後的資料檢核項目 Word：`傳播調查資料庫第四期第一次正式_資料檢核項目0614.docx`。
  - dry-run 匯入結果：47 列。
  - 自動條件：37 列。
  - review：10 列。
  - 已產生 CSV/report：`傳播4-1/generated/external_check_items_0614.csv`、`傳播4-1/generated/external_check_items_0614_report.json`。

原始 workbook 狀態：

- `傳播4-1/檢核程式套印-傳播4-1.xlsx` 當時被 Excel 鎖定，旁邊有 `~$檢核程式套印-傳播4-1.xlsx`。
- 因鎖定，未能直接寫回原始 workbook。
- 已產生可比對副本：
  - `傳播4-1/generated/檢核程式套印-傳播4-1.external0614.updated.xlsx`
- 副本已成功寫入 `檢核項目清單`。

檢核項目清單 remaining review 類型：

- `E5,E6,D3` 手機上網時間合計大於總時間 2 小時：可後續補時間加總差距規則。
- `E14` 網路消費大於 `O5` 收入：需要收入級距對應表。
- `Z2_1/Z2_2/ZE2_1/ZE2_3` 電話、手機、Email：需要字串格式、重複值、網域清單等專門規則。
- `Q47/Q48/Q62/Q53` 搭配 `Q51/P3_1` 的 0 分與政黨/統獨立場列出確認：語意穩定，後續可補自動轉換規則。

skill 適用性觀察：

- 五個主 skill 可用且已通過 quick validation。
- `.codex/skills/syntaxwork-external-checks` 與 `syntaxwork-check-items` 功能重疊；後續建議以 `syntaxwork-check-items` 作為五大主流程之一，`syntaxwork-external-checks` 只保留為舊名稱/相容參考，避免流程分歧。

## 2026-06-19 follow-up: all sheet to Excel section skeletons

## 2026-06-20 開放欄位辨識規則更新

`淨零/tools/fill_excel_sections_from_all.py` 現在支援：

- `all` 找不到 `last` 時，從第 1 筆變項資料開始（Excel 第 2 列），不再中止。
- 開放欄位預設只把「最後一個小寫 `o` 後面接純數字」辨識為選項型欄位，例如 `vO1o88` 會正確拆成原題變項 `vO1` 與選項 `88`；大寫題號中的 `O` 不會被誤判。
- 可用 `--open-option-marker` 變更該標記，保留未來不用 `o` 的彈性。
- 是否為複選題改以 `複選題變項清單` 是否有對應的 `v題號m選項` 變項判斷；複選題寫入 `var2_new=v題號m選項`、`range_new=1`。
- 含 `city` 的欄位維持 `var2_new` 指向 city 原始變項，`range_new` 固定為 `29`。
- 沒有選項標記的純開放欄位不再填入臆測的 `var2_new/range_new`；SPSS 只會在 key-in 日期範圍內列出非空白內容供確認，不生成「應答而未答／不該答而答」兩段跳答檢核。

測試輸出：

- `傳播4-1/generated/open_checks_after_marker_rules.sps`
- `傳播4-1/generated/marker_rule_verification.json`

## 2026-06-20 問卷邏輯組人工確認

`淨零/tools/refresh_logic_group_from_docx.py` 現在在寫入 Word -> Excel 邏輯組時，同步建立兩張人工審核工作表：

- `邏輯組_人工確認`：一列代表一個問卷邏輯規則，並列問卷原文、條件成立／不成立的轉譯、各自應答與不應答變項、實際邏輯組列號、人工確認與備註。
- `邏輯組_問卷線索`：列出所有偵測到的問卷跳答、顯示與流程線索，標示為「已產生對照規則／需人工判讀／未對照：請檢查／忽略：非資料應答邏輯」，用於檢查覆蓋完整性。

兩張表都會保留同一規則鍵下既有的 `人工確認` 與 `人工備註`；重跑不會洗掉人工判讀。

建議操作順序：

1. 先用 `--preview-workbook` 產生工作簿複本；複本會寫入候選邏輯組和兩張人工確認表，原檔不會變更。
2. 在 `邏輯組_人工確認` 篩選空白的 `人工確認`，逐列勾選或填入修正備註。
3. 在 `邏輯組_問卷線索` 篩選「需人工判讀」與「未對照：請檢查」，確認它們是顯示提示、解析器尚不支援的條件，或需要補入邏輯組的規則。
4. 人工確認後，才對正式 Excel 使用 `--apply`，再進入 Excel -> SPSS。

注意：目前 `refresh_logic_group_from_docx.py` 會追加邏輯內容，但不擅自猜測 `m/p` 編號範圍；因此預覽工作簿的新增邏輯列可供確認，尚不能直接交給 SPSS 產生器。正式自動套用前，需再建立每個專案明確的邏輯組 `m/p` 配號設定。

傳播 4-1 預覽結果：129 條可轉譯規則、5 條需人工判讀；問卷線索表共 237 條，其中 124 條已對照、4 條需人工判讀、107 條待人工確認。待確認不等於錯誤，它是刻意保留的完整性檢查清單。

## 2026-06-21 邏輯組跳答碼與選項範圍規則

`refresh_logic_group_from_docx.py` 的反向不應答條件現在會：

- 依 `all` 的數值型變項寬度推算基本跳答碼：寬度 5 -> `99996`，寬度 4 -> `9996`。
- 僅在前置變項本身也是「可能被邏輯跳過的目標題」時，才加上 `變項~=跳答碼` 守門條件。必答前置題不會被加入不可能出現的跳答條件。
- 例如前置題 `B5` 可被跳過時，`B5~=0` 的反向條件會成為 `B5~=0 & vB5~=9996`。

單選題的 `all` sheet 通常沒有合法選項碼資訊；若問卷文字使用寬鬆範圍（如 `01~88`），但中間值並不存在，可在可選的 `邏輯組_選項設定` sheet 填入：

| 題號 | 可用選項 | 說明 |
| --- | --- | --- |
| Q51 | 1-11,88 | 依問卷實際選項確認 |

轉換器會以這張表為優先依據。複選題仍會直接依 `all` 中實際存在的 `v題號m選項` 變項過濾，不會憑文字範圍補出不存在的選項。

## 2026-06-21 互斥與進階邏輯提案

- `refresh_logic_mutex_from_docx.py` 已和主邏輯解析器相容，可把問卷標註的選項互斥寫入 `邏輯組.互斥`；傳播 4-1 最新預覽偵測到 20 條可寫入規則、7 條待人工判讀。
- `淨零/tools/propose_advanced_logic_from_review.py` 會從人工確認表的已標註案例產生可審核的進階規則提案，並輸出正向應答與反向不應答條件。
- 目前已驗證五種類型：排除特殊碼後加總門檻、複選題選取數量、多選項加數值條件、複選題整題特殊碼、複選指定選項。
- 進階提案使用 `spss:` 前綴表示已是 SPSS 等價條件；`generate_logic_checks.py` 會保留其內容，不再重複轉譯。

傳播 4-1 目前檔案：

- `傳播4-1/generated/advanced_logic_proposals.csv`
- `傳播4-1/generated/advanced_logic_proposals.json`
- `傳播4-1/generated/logic_mutex_updated_rows.csv`

## 2026-06-21 問卷邏輯組表格與進階條件

問卷 -> Excel 的邏輯組 skill 已補強為保守的表格解析流程：

- 表格逐一讀取儲存格，不再把同一列多個選項合併成一段文字。
- 表格題號僅在「表格內題號明示」或「完整選項碼集合唯一對應 `all` 複選變項群組」時自動採用；不以 Word 表格序號作為規則。
- 無法唯一對應時，互斥報告會保留表格位置、選項碼、候選題號與原因，不會沿用前一題題號。
- 問卷中誤寫 `SFO` 而 `all` 為 `vSF0` 時，只有 `O -> 0` 校正後唯一命中既有變項才會自動修正。
- 「與 ZA0_1 選項互斥」會由問卷實際選項 `(01)/(02)` 展開為 `vZA0_1 in 1 | vZA0_1 in 2`，不猜測未列出的選項。

傳播 4-1 的表格互斥已唯一對應 `Q25`；`ZA0`、`ZA0_1` 與 `SF0` 的互斥規則也已可提出。輸出：

```text
傳播4-1/generated/logic_mutex_table_context_review.csv
```

一般文字規則解析不到、但已由人工確認的五類進階規則，會改標示為 `resolved_advanced`，不再重複列為人工 review：

```text
E3_1  四碼時間總和超過 24 小時
B7    複選題有效選取數量
I4    複選選項與數值 0 的組合
P3_5  複選整題特殊碼與 Q5 跳答
ZE2_1 複選選項續答
```

另新增可重複使用的 `CKE5`、`CKE8`、`CKE11` 設備/時間檢查題偵測；其條件會依設備選項、使用情境與成對時間欄位是否同為 0 產生正向應答及反向不應答提案。

最終人工檢視入口：

```text
傳播4-1/generated/logic_group_full_proposals.csv
```

其中 `review=0`。欄位 `resolved_advanced` 表示一般解析器無法處理、但已由進階規則等價處理；`proposal_advanced` 則是需要配置正式邏輯組 m/p 編號後才能寫入 Excel 的進階規則。

新增測試工具：

```text
淨零/tools/fill_excel_sections_from_all.py
```

用途：

- 使用者完成 `all` sheet 後，工具從 `last` 變項列之後開始讀取正式問卷變項。
- 所有 `變項屬性=數值` 的變項補入 `數值題` sheet。
- 所有 `變項屬性=字串/文字` 的變項補入 `開放欄位` sheet。
- 變項名稱符合 `v...m數字` 的數值變項辨識為複選展開變項，補入 `複選題變項清單`。
- 依複選分組補入 `複選題` 主表。
- `複選題內_互斥` 不由此工具產生；仍由問卷 -> Excel skill 或人工規則處理。

測試檔：

```text
傳播4-1/檢核程式套印-傳播4-1測試.xlsx
```

測試結果：

```text
last row: 22
all vars after last: 864
numeric vars: 804
text vars: 60
multi groups: 36
multi vars: 586
```

寫入結果：

```text
數值題: 804 rows
開放欄位: 60 rows
複選題變項清單: 586 rows
複選題主表: 36 rows
```

輸出報告：

```text
傳播4-1/generated/fill_sections_from_all_report.json
傳播4-1/generated/excel_precheck_after_fill_from_all_report.json
傳播4-1/generated/numeric_checks_after_fill_from_all_report.json
傳播4-1/generated/open_checks_after_fill_from_all_report.json
傳播4-1/generated/multi_checks_after_fill_from_all_report.json
```

目前觀察：

- Excel precheck 僅剩 7 筆 warning，都是特殊文字欄位寬度不是 150：
  - `vE3_1`
  - `vZ2_1g1`
  - `vZ2_1g2`
  - `vZ2_2`
  - `vZE2_1`
  - `vZE2_2`
  - `vZE2_3`
- 這些欄位不是一般「其他請說明」型開放欄位，未來應由專門字串格式檢核或 `檢核項目清單` 處理，不應強制套用一般開放欄位公式。
- 開放欄位 SPSS 產生器可產生 53 筆，跳過上述 7 筆需要 parent/range 專門規則的特殊字串欄位。
- 數值題 sheet 可由 all 補出 804 筆骨架，但 `all` 不包含答案範圍，因此 `r1-r4` 仍需由 Word 規則或人工補齊；目前 numeric SPSS 產生器會跳過 r1-r4 空白列。
- 複選題主表已可由 all 的 `v...m數字` 變項自動產生。
- 若複選分組含 `m90/m96/m99`，工具會自動補 `全部無反應選項` 與 `無反應選項1`。
- `generate_multi_checks.py` 已修正：若複選題主表沒有無反應碼，不再自動 fallback 為 96，只做至少選一項檢查。

架構判斷：

- `all` 可以作為「欄位骨架 single source of truth」。
- `數值題/開放欄位/複選題/複選題變項清單` 可視為由程式補全的工作表。
- 問卷語意型欄位，例如數值範圍、特殊碼、互斥選項、字串格式檢查，仍需由 Word -> Excel skill、檢核項目清單或人工規則補充。


## 2026-06-26 rule confirmations

- 邏輯組：傳播4-1 目前 5 個 `resolved by advanced rule` 人工確認為正確，可視為已接受規則。
- 開放欄位：若開放欄位變項名稱沒有小寫 `o` 選項標記，Excel 可維持不完整狀態但仍需使用者填 `m/p`。Excel -> SPSS 時，`var2_new` 空白列不轉換；`var2_new` 有值但 `range_new` 與 `n` 空白時，只產生內容列出確認，不產生應答/不應答檢核。
- 數值題：跳答碼依變項寬度判斷，不再依有效範圍位數判斷；寬度 2 -> `96`，寬度 3 -> `996`，寬度 4 -> `9996`，寬度 5 -> `99996`。
- 檢核項目清單：欄位改為 `m/p/s/s=/項目編號/題號/變項名稱/檢核說明/備註/條件/額外列出變項`。Word -> Excel 匯入時 `m/p/s` 同號順編，從邏輯組最大編號後的下一個 `x01` 區段開始，例如邏輯組到 764，檢核項目清單從 801 開始；`s=` 留給使用者填。`項目編號` 依 A/B 組與列順序產生，如 `【A01】`、`【B01】`。
- Excel -> SPSS section 標題：數值題 `**一、不合理值檢核.`；開放欄位 `**二、開放欄位檢核.`；複選題含複選題內互斥 `**三、複選題檢核.`；邏輯組 `**四、邏輯檢核.`；檢核項目清單 `**五、檢核項目清單.`。


## 2026-06-26 app architecture and step-1 test

Final app scope should contain only two user-facing steps:

1. Excel all sheet -> section skeleton fill. The user selects an Excel workbook. The app checks that exactly one sheet is named `all`, required headers exist (`變項名稱/變項屬性/寬度`), variable rows exist, variable names are unique, type/width cells are complete, and widths are positive integers. If this passes, the app fills `數值題`, `開放欄位`, `複選題`, and `複選題變項清單` from `all`.
2. Excel -> syntax export. Before export, run SPSS-producing-sheet checks such as required headers, blank required cells, global `m/p/s` duplicates, formula errors, and type/width consistency. Exporters should be pluggable so SPSS is one backend now and Stata or other syntax backends can be added later.

Questionnaire Word -> Excel skills remain a development/assistant workflow and should not be part of the final app UI for now.

Recommended app design for Windows portability: package the app as a self-contained Windows executable/folder (for example a Python GUI packaged with PyInstaller or an equivalent desktop wrapper). It should read/write `.xlsx` directly without requiring Microsoft Excel or Python installation on the target computer. Keep the core logic separated into: workbook reader/precheck, section filler, intermediate check model, exporter plugins, and report writer.

Step-1 test on `傳播4-1/檢核程式套印-傳播4-1測試.xlsx`:

- all precheck passed with no issues.
- `last` marker found at row 22; variables after `last`: 864.
- Filled/expected section rows: `數值題=804`, `開放欄位=60`, `複選題=36`, `複選題變項清單=586`.
- Lightweight duplicate check found no duplicate `m/p/s` values across the relevant SPSS-producing sheets after step 1.
- The older full `validate_excel_structure.py` can be slow on this workbook and should not be used synchronously in the app UI without progress reporting or segmentation.


## 2026-06-26 step-2 questionnaire/check-item fill test

Applied Word -> Excel development skills to `傳播4-1/檢核程式套印-傳播4-1測試.xlsx` using:

- `2026年臺灣傳播調查資料庫正式調查問卷.docx`
- `傳播調查資料庫第四期第一次正式_資料檢核項目0614.docx`

Results:

- Numeric fields: 804 rows total; 763 stable rows filled into `r1-r4`; 41 rows remain manual because no reliable numeric range was found.
- Open fields: 60 rows; `var2_new/range_new/n` present for all rows after formula-column fill.
- Multi-response: 36 groups detected; 35 matched and were applied; `vM4s / M4S` remains review because the question block was not found in the questionnaire text.
- Multi-response mutual exclusion: 7 real rows applied. The sheet may retain formatted blank rows below the real data.
- Logic groups: 256 real rows generated from the questionnaire; 5 rows remain in the manual-review output sheet.
- External check-item list: 47 rows imported from the 0614 check-item Word file; 43 conditions auto-filled and 4 review rows keep blank conditions. `項目編號` is filled as `【A01】`, `【B01】`, etc.
- Lightweight validation after writing found no duplicate constant `m/p/s` values. Formula cells such as `=A2` are not treated as actual duplicate IDs until Excel recalculates them.

Implementation note: `fill_multi_sheets_from_docx.py` now skips applying multi-response proposals whose status is not `match`, so review items stay available for manual handling instead of being overwritten.


## 2026-06-26 questionnaire-to-excel skill rule update

- Numeric questionnaire -> Excel fill now checks and repairs the `range` formula when stable `r1-r4` values are applied. The formula is the workbook's standard CONCAT expression that builds the SPSS validity expression from `in_or_not`, `var`, `r1-r4`, and decimal rules.
- Open-field questionnaire -> Excel fill now focuses on variable completeness and multiple-response status. It does not broadly refill `var2_new/range_new/n`; those columns are only filled when the variable is an option-triggered open field such as `o##` or `_oth`.
- Multi-response fill now treats `96/97/98` as standard special/no-response codes for unavailable/no-response fields without requiring expanded `m96/m97/m98` variables unless the workbook explicitly lists them.
- Multi-response internal mutex ranges now compare against the actual variable list. Noncontinuous target values are moved to `非連續互斥選項`; for example K1 uses `互斥選項編號_迄=13` and `非連續互斥選項=88`.
- Logic-group refresh now writes confident rows directly to `邏輯組` only. New ambiguous review/cue items should be written to generated external reports, not inserted as extra sheets in the project workbook.

Applied to `傳播4-1/檢核程式套印-傳播4-1測試.xlsx`: numeric ranges were reapplied with range formulas, and multi-response/mutex rows were refreshed after the special-code and noncontinuous-mutex update.


### Numeric range split follow-up

After adding `range` formula repair, numeric option-code ranges were refined to split actual continuous runs instead of using min/max across gaps. Example from the current 傳播4-1 questionnaire: `vA3` is parsed as `r1=1,22`, `r2=88`, `r3=97,98` because the Word file lists `(22)連江縣` and `(88)其他`. This differs from the older noted expectation `1,21 / 97,98` and should be confirmed by the user if the questionnaire version changes. Stable option-code split mismatches may now be applied; manual rows remain untouched.


## 2026-06-26 logic-group full rebuild update

The logic-group questionnaire -> Excel skill now rebuilds the `邏輯組` content area from row 2 instead of appending after formatted blank rows. It clears only logic action columns (`條件/應答/不應答/限制/互斥`) and preserves user-controlled ID columns such as `m/p/s/s=`. Old in-workbook review/cue sheets are not generated.

For the current 傳播4-1 questionnaire, five previously unresolved review cases are now handled by advanced deterministic rules:

- `E3_1`: E5/E6/E8/E9/E11/E12 HHMM minute total > 2400, excluding 9797/9898 values.
- `B7`: B7a selected-option count controls whether B7 should be answered.
- `I4`: B8m03 or B8m06 plus I1=0 and I3=0.
- `Q27`: K2m90 or Q5 in 2/97/98 skip rule, with inverse required-answer rule.
- `ZE2_1`: ZE2m01 or ZE2m02 required-answer rule.

Applied to `傳播4-1/檢核程式套印-傳播4-1測試.xlsx`: `邏輯組` now has 266 real rows starting at row 2; report `step2_logic_apply_advanced_rebuild_report.json` shows `review=0`.


## 2026-06-26 logic mutex rebuild update

After the logic-group full rebuild, cross-question option mutex rules must also be rebuilt. Use `rebuild_logic_mutex_and_sort.py` after `refresh_logic_group_from_docx.py`: it removes old mutex-only rows, collects questionnaire `互斥/選項互斥` cues, appends mutex-only rows into `邏輯組`, and sorts rows by variable order from `all`.

Applied to `傳播4-1/檢核程式套印-傳播4-1測試.xlsx`: 28 cross-question mutex rules were added, `review=0`, making `邏輯組` contain 294 real rows in total. Sample rules include `vA9 in 1` mutually exclusive with `vO1_1 in 1..4`.
