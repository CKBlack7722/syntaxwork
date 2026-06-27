# Syntaxwork Tools

This folder contains reusable Syntaxwork automation tools.

Project/sample folders such as `消費者`, `消費者2`, `淨零`, and `傳播4-1`
should be treated as replaceable test data folders. Do not place reusable
skills, app code, or shared tooling inside those folders.

Typical usage:

```powershell
& 'C:\Users\choco\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' tools\generate_logic_checks.py --workbook 傳播4-1\檢核程式套印-傳播4-1測試.xlsx --output 傳播4-1\generated\logic_checks_generated.sps --report 傳播4-1\generated\logic_checks_report.json
```
