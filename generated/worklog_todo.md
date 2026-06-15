# Worklog TODO

## Excel to SPSS numeric valid expression

- Future APP should avoid asking users to hand-compose the numeric `range` column.
- Instead, read structured fields (`r1`-`r4`, decimal rule, and any extra condition) and generate one positive `valid_expr`.
- Final SPSS numeric check should use `do if not(valid_expr) | sys(var).`
- Decimal constraints must be combined with valid range by `&`, for example `(range(v,1,10) & mod(v*2,1)=0)` for integer-or-.5 values.
- Keep `any/range` as generated/intermediate logic rather than a user-maintained requirement when possible.

