@echo off
setlocal
cd /d "%~dp0\.."
call "C:\Program Files\IBM\SPSS Statistics\pythonenv.bat" 3 /e
"C:\Program Files\IBM\SPSS Statistics\Python3\python.exe" "tools\validate_generated_logic_with_spss.py"
set VALIDATION_EXIT=%ERRORLEVEL%
endlocal & exit /b %VALIDATION_EXIT%
