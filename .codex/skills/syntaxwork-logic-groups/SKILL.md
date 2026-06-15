---
name: syntaxwork-logic-groups
description: Fill and validate Syntaxwork logic-group Excel sheets from questionnaire Word files. Use when Codex needs to infer skip/display/filter/logic conditions from .docx questionnaires into project workbooks, compare questionnaire logic with Excel, or prepare logic-group content before SPSS syntax generation.
---

# Syntaxwork Logic Groups

## Core Workflow

Use this skill for the questionnaire -> Excel step only. Do not edit questionnaire Word files.

1. Read the project workbook `all` sheet first to understand variable names, types, widths, and labels.
2. Parse the questionnaire `.docx` in document order, preserving paragraphs and tables.
3. Extract logic conditions from bracketed instructions such as `【A答(01)者,需回答此題】`, display-question notes, skip notes, and table-scoped conditions.
4. Fill only confident logic-group rows. Leave ambiguous conditions blank and report them.
5. Compare filled rows against questionnaire text and existing generated reports before moving to Excel -> SPSS.

## Required Rules

- Use comma-separated variables, never `|`, in Excel fields that list variables.
- Treat display-only date questions as numeric width `14` fields in `all`; final apps should allow user-configured start/end dates.
- For 4-digit time fields such as `K1G2`, add validation logic that prevents impossible minutes: the third digit cannot be `6`, `7`, `8`, or `9`.
- Use markers only in generated SPSS, not in questionnaire files: `* SYNTAXWORK_BEGIN_LOGIC.` and `* SYNTAXWORK_END_LOGIC.`
- If a condition requires interpretation across distant questions, record a review item rather than guessing.

## Validation

Run a small batch first, then full workbook fill. The report should list:

- matched rows
- blank/manual rows
- variables not found in `all`
- logic references not found in questionnaire
- time/date special handling

Do not proceed silently when a logic condition cannot be mapped to SPSS-compatible expressions.
