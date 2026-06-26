---
name: syntaxwork-check-items
description: Import and validate project-specific Syntaxwork check-item lists from Word tables into Excel. Use when Codex needs to read 題號/變項名稱/檢核說明/備註 tables from .docx files, create or update 檢核項目清單, infer SPSS conditions, or list manual review items.
---

# Syntaxwork Check Items

## Core Workflow

Use this skill for questionnaire-adjacent project-specific check items that are not part of the base logic, numeric, multiple-response, or open-field sheets.

1. Read the Word table columns `題號`, `變項名稱`, `檢核說明`, and `備註`.
2. Import into workbook sheet `檢核項目清單`.
3. Keep columns: `m`, `p`, `s`, `s=`, `項目編號`, `題號`, `變項名稱`, `檢核說明`, `備註`, `條件`, `額外列出變項`.
4. Auto-allocate `m/p/s` with the same sequence number, starting at the next `x01` block after the logic-group maximum, for example logic group ending at 764 means check items start at 801. Leave `s=` blank for user values.
5. Fill `項目編號` from Word table group/order as `【A01】`, `【A02】`, `【B01】`, etc.
6. Exclude rows where `備註=刪除`.

## Required Rules

- Use commas, not `|`, for multiple variables.
- Convert `檢核說明` to an SPSS-compatible `條件` only when confident.
- Use `備註` to infer `額外列出變項`.
- For notes like `列出E5~E12加總合計時數`, verify that source variables are compatible width-5 time fields before creating aggregate minute variables.
- For aggregate variables such as `sumE5_E12_min`, include only valid time variables such as `vE5,vE6,vE8,vE9,vE11,vE12`; exclude incompatible width-4 variables such as `vE7,vE10`.
- Rules like `vE5、vE6 ... 時間相加大於 vD3 的時間 2 小時` can be converted when the variables are HHMM-like time fields. Current project convention renders this as `(vE5+vE6)>(vD3+200)`.
- Rules like `Q47答0分者,在Q51答(01)...` or `Q53答(01)...,P3_1答0分者` can be converted into direct score/option conditions such as `vQ47=0 & vQ51=1` or `vQ53=1 & vP3_1=0`.
- Phone, mobile, Email, duplicate-value, and income-category checks should remain review items unless a dedicated project rule/list is available.

## Validation

Report:

- imported row count
- deleted row count
- auto condition count
- manual/review condition count
- aggregate variables generated and their exact source variables
- rows blocked by missing variable metadata
