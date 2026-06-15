---
name: syntaxwork-check-items
description: Import and validate project-specific Syntaxwork check-item lists from Word tables into Excel. Use when Codex needs to read 題號/變項名稱/檢核說明/備註 tables from .docx files, create or update 檢核項目清單, infer SPSS conditions, or list manual review items.
---

# Syntaxwork Check Items

## Core Workflow

Use this skill for questionnaire-adjacent project-specific check items that are not part of the base logic, numeric, multiple-response, or open-field sheets.

1. Read the Word table columns `題號`, `變項名稱`, `檢核說明`, and `備註`.
2. Import into workbook sheet `檢核項目清單`.
3. Keep columns: `m`, `p`, `題號`, `變項名稱`, `檢核說明`, `備註`, `條件`, `額外列出變項`.
4. Leave `m` and `p` blank for user assignment.
5. Exclude rows where `備註=刪除`.

## Required Rules

- Use commas, not `|`, for multiple variables.
- Convert `檢核說明` to an SPSS-compatible `條件` only when confident.
- Use `備註` to infer `額外列出變項`.
- For notes like `列出E5~E12加總合計時數`, verify that source variables are compatible width-5 time fields before creating aggregate minute variables.
- For aggregate variables such as `sumE5_E12_min`, include only valid time variables such as `vE5,vE6,vE8,vE9,vE11,vE12`; exclude incompatible width-4 variables such as `vE7,vE10`.

## Validation

Report:

- imported row count
- deleted row count
- auto condition count
- manual/review condition count
- aggregate variables generated and their exact source variables
- rows blocked by missing variable metadata
