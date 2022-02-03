codebrws "<%1>%2/%3(%4)" 
if ERRORLEVEL 1 goto Error
exit 0
:Error
echo Cannot view file, code browser not installed.
pause
exit 1
