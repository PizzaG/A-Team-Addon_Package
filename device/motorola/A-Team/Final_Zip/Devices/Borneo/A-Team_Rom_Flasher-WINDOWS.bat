@echo off

del /f Windows-log.txt

%~d0
cd %~dp0\A-Team

echo:
.\WINDOWS.bat | ../Tee-Object Windows_log.txt

