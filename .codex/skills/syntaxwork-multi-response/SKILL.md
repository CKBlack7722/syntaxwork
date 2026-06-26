---
name: syntaxwork-multi-response
description: Fill and validate Syntaxwork multiple-response Excel sheets from questionnaire Word files. Use when Codex needs to compare user-provided multiple-response variable lists with .docx questionnaire options, fill 複選題 and 複選題內_互斥 sheets, or prepare multiple-response content before SPSS syntax generation.
---

# Syntaxwork Multi Response

## Core Workflow

Use this skill when `複選題變項清單` is already populated or needs to be checked against a questionnaire.

1. Treat `複選題變項清單` as the authoritative user-provided variable list.
2. Infer each group from variable names such as `vK1m01 -> K1`; do not rely only on Excel formula cache.
3. Compare option codes in the Word question block with the variable list.
4. Ignore questionnaire-only `97` and `98` during expanded-variable comparison unless the workbook explicitly includes those variables.
5. Fill `複選題_*` and `複選題內_互斥` only for matched groups.

## Excel Conventions

- In `複選題_*`, write `題號` without the leading `v` because downstream Excel formulas depend on the bare question id.
- Keep `m` and `p` under user control. Do not invent new IDs unless explicitly asked.
- If `p` is blank or an Excel formula cache is unavailable during SPSS generation, the generator may fall back to `m`.
- Internal mutex rows should only be auto-filled for stable question-internal range rules such as `選項(90)與選項(01)-(88)互斥`.
- Do not convert external conditional conflicts such as `D1答(03)者,與選項(01)互斥` into unconditional multiple-response mutex rows.

## Validation

Report:

- all groups and option counts
- doc-only codes after ignoring allowed special codes
- variable-list codes missing from questionnaire
- internal mutex rows created
- rows blocked by missing `m/p`

A group is safe to apply only when questionnaire codes and variable-list codes match after allowed special-code filtering.

## 2026-06-26 Rule Update

- Treat `96`, `97`, and `98` as standard special/no-response codes: do not require expanded `m96/m97/m98` variables unless the workbook explicitly lists them, but do capture them in unavailable/no-response fields.
- For internal mutex ranges, do not blindly use the largest number as `互斥選項編號_迄`. Compare against the actual variable list. Write the continuous portion to `互斥選項編號_起/迄` and place remaining values in `非連續互斥選項`; for example K1 uses `迄=13` and `非連續互斥選項=88`.
