---
name: syntaxwork-open-fields
description: Fill and validate Syntaxwork open-field Excel sheets from questionnaire Word files. Use when Codex needs to infer open-text fields from questionnaire options, decide whether an open field belongs to a multiple-response question, fill open-field workbook columns, or compare open-field Excel content with example SPSS syntax.
---

# Syntaxwork Open Fields

## Core Workflow

Use this skill for questionnaire -> Excel open-field rows, not final SPSS generation.

1. Find options marked `其他,請說明`, `其它,請說明`, `其他`/`其它` followed by underscores, `開放欄位`, `開放填答`, or equivalent text.
   These markers may appear in inline option lists or inside option tables.
2. Determine whether the parent question is a multiple-response question.
3. Fill open-field Excel columns from the questionnaire and existing workbook formula requirements.
4. Compare with the original example SPSS syntax pattern before claiming the workbook is complete.

## Required Excel Fields

Analyze the workbook formulas and fill all fields actually used by downstream syntax generation. Current required fields to verify include:

- `題號`
- `題號變項名稱`
- `選項數值`
- `是否複選`
- `var2_new`
- `range_new`
- `n`

If a field is formula-derived in the workbook, preserve or regenerate the formula pattern. If formula cache is unreliable, generate deterministic values from source fields.
For multiple-response open fields such as `vQ22o88`, keep the open text variable as `vQ22o88` but derive the parent option variable as `vQ22m88` for formula comparison and later SPSS conditions.

## SPSS Pattern To Preserve

Open-field checks usually need three situations:

- should answer but blank
- should not answer but has text
- answered and should be listed for content review within key-in date range

Do not hard-code one example question. Infer the parent variable, option value, open variable, width, and message variable from Excel.

## Validation

Report:

- open fields found in questionnaire
- rows where parent option value is ambiguous
- rows where multiple-response status is uncertain
- fields required by formulas but still blank
- variables missing from `all`
