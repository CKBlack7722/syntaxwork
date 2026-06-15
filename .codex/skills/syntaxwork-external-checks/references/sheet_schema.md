# 檢核項目清單 Sheet Schema

Required columns, in order:

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

Column behavior:

- `m`: SPSS message variable number. User-defined unless explicitly allocated by the tool.
- `p`: SPSS problem variable number. User-defined unless explicitly allocated by the tool.
- `題號`: Imported from Word. Use comma-separated values when multiple questions apply.
- `變項名稱`: Imported from Word. Use comma-separated variables when multiple variables apply.
- `檢核說明`: Imported from Word.
- `備註`: Imported from Word. Used to identify deletion, quality-control notes, and extra output variables. Rows marked deleted should be excluded during import.
- `條件`: SPSS boolean expression generated from `檢核說明`.
- `額外列出變項`: Comma-separated variables to include in output messages beyond `變項名稱`. May include generated aggregate variables such as `sumE5_E12_min`.

Recommended generated artifacts:

- `generated/external_check_items_*.csv`: raw Word extraction.
- `generated/external_check_item_proposals.csv`: proposed conditions and extra variables.
- `generated/external_check_syntax_generated.sps`: generated SPSS blocks.
- `generated/external_check_worklog.md`: decisions, assumptions, review items, and unresolved rows.
