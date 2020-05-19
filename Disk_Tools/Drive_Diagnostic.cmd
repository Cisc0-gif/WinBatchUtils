@echo off
title Full Drive Diagnostic Scan
cleanmgr
defrag C: /u
defrag C: /x /u
defrag C: /g /u
chkdsk /f /r /scan
sfc /scannow
cd "%programfiles%\Windows Defender"
mpcmdrun.exe scan -2
mpcmdrun.exe trace
mpcmdrun.exe getfiles -scan
pause
exit