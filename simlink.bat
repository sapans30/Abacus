@echo off

rem make symbolic link, for example,
rem mklink /D "X:\Program Files (x86)\Aldon\Aldon LM\" "X:\Program Files (x86)\Aldon\Aldon LM 6.4"

echo %date% %time% >>%temp%\simlink.log
echo %0>>%temp%\simlink.log
set target=%0

rem remove surrounding quotes
for /f "useback tokens=*" %%a in ('%target%') do set target=%%~a
echo %target% >>%temp%\simlink.log

rem strip off this name
For %%A in ("%target%") do (
    Set Folder=%%~dpA
    Set Name=%%~nxA
)

echo exec folder is: %Folder% >>%temp%\simlink.log
echo exec name is: %Name% >>%temp%\simlink.log

rem strip off trailing slash
set Folder=%Folder:~0,-1%
echo stripped folder is: %Folder% >>%temp%\simlink.log

rem now get parent of the install directory
For %%A in ("%Folder%") do (
    Set parentFolder=%%~dpA
    Set parentName=%%~nxA
)

echo parent folder is: %parentFolder% >>%temp%\simlink.log
echo parent name is: %parentName% >>%temp%\simlink.log

Set simlink=%parentFolder%Aldon LM
set mklinkcmd=mklink /D "%simlink%\" "%Folder%"
echo %mklinkcmd% >>%temp%\simlink.log

if exist "%simlink%" rmdir /Q "%simlink%"
%mklinkcmd%
exit 0
