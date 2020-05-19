@echo off
title 
:: variables
SET odrive=%odrive:~0,2%
set backupcmd=xcopy /s /c /d /e /h /i /r /y
rename "SystemFileCopy-Custom.cmd" "SystemFileCopy-%userdomain%.cmd"
echo off
set /p custom="Do you want to add a custom file path?[Y/N]: "
if "%custom%"=="Y" goto customcopy
if "%custom%"=="N" goto copy
:customcopy
set /p customfp="Enter filepath you want to copy: "
set /p customfpname="Enter the name of copied file path: "
:copy
%backupcmd% "%USERPROFILE%\desktop" "%drive%\CopiedFiles-%userdomain%\Desktop"
%backupcmd% "%USERPROFILE%\pictures" "%drive%\CopiedFiles-%userdomain%\Pictures"
%backupcmd% "%USERPROFILE%\Favorites" "%drive%\CopiedFiles-%userdomain%\Favorites"
%backupcmd% "%USERPROFILE%\videos" "%drive%\CopiedFiles-%userdomain%\Videos"
%backupcmd% "%USERPROFILE%\documents" "%drive%\CopiedFiles-%userdomain%\Documents"
%backupcmd% "%USERPROFILE%\music" "%drive%\CopiedFiles-%userdomain%\Music"
%backupcmd% %customfp% "%drive%\CopiedFiles-%userdomain%\%customfpname%"
(
echo Desktop Apps
dir %userprofile%\Desktop
echo.
) > "%drive%\CopiedFiles-%userdomain%\DesktopApps.txt"
(
echo Program Files
dir "C:\Program Files"
echo.
) >> "%drive%\CopiedFiles-%userdomain%\DesktopApps.txt"
(
echo Program Files x86
dir "C:\Program Files (x86)"
echo.
) >> "%drive%\CopiedFiles-%userdomain%\DesktopApps.txt"
compact /c /s "CopiedFiles-%userdomain%"
@echo off 
cls