@echo off

IF EXIST Windows_log.txt (
    del Windows_log.txt
) 

%~d0
cd %~dp0\A-Team

echo:
cmd /c .\WINDOWS.bat 2>&1 | tee ../Windows_log.txt 2>&1



