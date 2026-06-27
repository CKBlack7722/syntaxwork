---
name: syntaxwork-logic-groups
description: Fill and validate Syntaxwork logic-group Excel sheets from questionnaire Word files. Use when Codex needs to infer skip/display/filter/logic conditions from .docx questionnaires into project workbooks, compare questionnaire logic with Excel, or prepare logic-group content before SPSS syntax generation.
---

# Syntaxwork Logic Groups

## Core Workflow

Use this skill for the questionnaire -> Excel step only. Do not edit questionnaire Word files.

1. Read the project workbook `all` sheet first to understand variable names, types, widths, and labels.
2. Parse the questionnaire `.docx` in document order, preserving paragraphs and tables. Read table cells separately; do not concatenate a whole row when an option-level rule may be present.
3. Extract logic conditions from bracketed instructions such as `【A答(01)者,需回答此題】`, display-question notes, skip notes, and table-scoped conditions.
4. Fill only confident logic-group rows. Leave ambiguous conditions blank and report them.
5. Add deterministic `限制` rows that belong to logic-group validation, such as HHMM minute checks.
6. Rebuild cross-question mutex rows as the second sub-step of the same logic-group workflow.
7. Compare filled rows against questionnaire text and existing generated reports before moving to Excel -> SPSS.

## Required Rules

- Use comma-separated variables, never `|`, in Excel fields that list variables.
- Bracketed questionnaire text with `需回答此題`, `需答此題`, or equivalent wording should create a required-answer logic row. Also create the reverse row as a forbidden-answer rule when the condition is false.
- Bracketed questionnaire text with `不需回答此題`, `不需答此題`, `不須回答此題`, or equivalent wording should create a forbidden-answer logic row. Also create the reverse row as a required-answer rule when the inverse condition is stable.
- If one questionnaire item has multiple bracketed instructions with the same direction, such as two `不需回答此題` notes or two `需回答此題` notes, merge them before writing Excel: the direct condition is joined with OR, and the reverse condition is joined with AND. For example, Q1 with `G1=0 不需回答` and `A9=01 不需回答` becomes `vG1 in 0 | vA9 in 1` for forbidden-answer and `vG1~=0 & vA9~=1` for required-answer.
- Override for multiple bracketed instructions: multiple skip / `不需答` instructions use OR for the forbidden-answer condition and AND for the reverse required-answer condition; multiple need / `需答` instructions use AND for the required-answer condition and OR for the reverse forbidden-answer condition. Example: Q1 with two skip notes becomes `vG1 in 0 | vA9 in 1`; E5 with two need notes becomes `(branch1) & (branch2)`.
- When a questionnaire qid is not present as a direct `v{qid}` variable in `all`, resolve stable grouped targets from `all`, including multi-choice `m##`, grouped numeric/time `g#`, and grouped scale `s...` suffixes. Keep open-ended `o##` variables out of logic target lists unless explicitly required.
- For large multi-choice ranges such as `G7或G8或...答(01)-(88)`, expand only option variables that actually exist in `all`; do not require every code in the written range to exist as a column.
- For grouped hour/minute variables such as `vM1g1,vM1g2`, a questionnaire condition like `M1答0` can be treated as both grouped variables equal to `0` when this matches the time-question context.
- Add the optional `互斥` column immediately after `限制` in `邏輯組`. Use it for questionnaire option notes such as `選項互斥`, `與此選項互斥`, `與選項(01)-(88)互斥`, or `A09答(01)者,選項互斥`.
- For mutex rows, write the prerequisite in `條件` and the forbidden simultaneous option/condition in `互斥`; leave `應答`, `不應答`, and `限制` blank. Example: `條件=vA9 in 1`, `互斥=vO1_1 in 1`.
- Ignore display-check wording such as `互斥無法點選,選項號隱藏` for mutex extraction; these belong to numeric/check-display handling instead.
- Treat display-only date questions as numeric width `14` fields in `all`; final apps should allow user-configured start/end dates.
- For 4-digit time fields such as `D3` or `K1G2`, add validation logic that prevents impossible minutes: the minute tens digit cannot be `6`, `7`, `8`, or `9`.
  - In Excel `邏輯組.限制`, write this as `vD3 minute_tens in 0,1,2,3,4,5`.
  - The current deterministic rule is: if `數值題` has `寬度=5` and `r1=1,2359`, treat it as an HHMM field that needs this limit row.
  - These rows are part of the main logic-group rebuild, not an optional post-processing step.
- Use markers only in generated SPSS, not in questionnaire files: `* SYNTAXWORK_BEGIN_LOGIC.` and `* SYNTAXWORK_END_LOGIC.`
- If a condition requires interpretation across distant questions, record a review item rather than guessing.

## Tables And Uncertainty

Tables are a high-risk source of false mappings because a nearby heading, a table number,
or a partial overlap of option codes is not proof of the underlying question. Use this
evidence order when a table must be mapped to a question in `all`:

1. An explicit question ID in the table heading or its immediate, unambiguous context.
2. A **unique exact** match between the table's substantive option-code set and one
   multiple-response variable group in `all`. Ignore standard special codes only when
   they are clearly special options.
3. A user-confirmed mapping stored as project configuration, with a stable table
   fingerprint (for example heading text plus option-code set), rather than only a
   Word table index.

Never write a rule from a partial match, from the largest overlap, or from a remembered
mapping such as `table 15 -> Q25`. Word table numbering changes as questionnaires are
edited. An unresolved table must also not inherit the preceding paragraph's question ID.

For every unresolved table rule, produce a review item containing the source cell,
table index (diagnostic only), option-code set, candidate question IDs, and the exact
reason it was not applied. Ask the user to confirm the mapping before generating an
Excel logic row or SPSS syntax.

## Validation

Run a small batch first, then full workbook fill. The report should list:

- matched rows
- blank/manual rows
- variables not found in `all`
- logic references not found in questionnaire
- time/date special handling
- table mappings that were applied, plus unresolved table candidates and their evidence

Do not proceed silently when a logic condition cannot be mapped to SPSS-compatible expressions.

## 2026-06-26 Rule Update

- Fill confident logic-group rows directly into the `邏輯組` sheet. If a new questionnaire has ambiguous logic needing review, generate a separate review output file instead of adding manual-confirmation or questionnaire-cue sheets to the project workbook.
- For the current 傳播4-1 questionnaire, previously handled manual-confirmation and questionnaire-cue issues should not be reinserted into the workbook.


## 2026-06-26 Full Rebuild Rule Update

- When applying questionnaire-derived logic rows, rebuild the `邏輯組` content area from row 2 instead of appending after formatted blank rows. Clear only logic action columns and preserve user-controlled `m/p/s/s=` columns.
- For the current 傳播4-1 questionnaire, advanced deterministic rules resolve E3_1 time-total gating, B7/B7a count gating, I4 B8/I1/I3 gating, Q27 K2/Q5 gating, and ZE2_1 ZE2 gating. These should produce `review=0` for this questionnaire version.


## 2026-06-26 Mutex Rebuild Rule Update

- After rebuilding the main logic rows, rebuild cross-question mutex rows with `rebuild_logic_mutex_and_sort.py`. This keeps questionnaire `選項互斥` cues in the `互斥` column of `邏輯組` and avoids confusing them with `複選題內_互斥`.
- For 傳播4-1, this produces 28 cross-question mutex rules with `review=0`; example: `vA9 in 1` is mutually exclusive with `vO1_1 in 1..4`.
- This is still considered part of the logic-group workflow. It remains a separate command because mutex extraction depends on option/table-level cues and final variable-order sorting; keeping it after the main rebuild prevents the main rebuild from accidentally deleting or duplicating mutex-only rows.

## 2026-06-27 ID Allocation Rule

- When applying logic-group rows to the workbook, allocate `m/p` only when requested by the workflow or UI, using `--allocate-ids`.
- The logic-group start id is the next `x01` block after previous SPSS-producing sheets in workbook order. For example, if the multiple-response section ends at `1136`, logic-group ids start at `1201`.
- After cross-question mutex rows are rebuilt and sorted, run id allocation again so every final logic-group row, including mutex-only rows and `限制` rows, has a continuous `m/p` id.
- `p` should be stored as a row-relative formula such as `=A2`, matching the existing numeric/open/multiple-response sections.
- If the workbook has an `s` column and the user/workflow enables S variables, fill `s` with the same id as `m`; leave `s=` blank for user-provided values. If S variables are not enabled, do not touch `s/s=`.
