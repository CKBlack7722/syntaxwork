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

再繼續下一階段。
