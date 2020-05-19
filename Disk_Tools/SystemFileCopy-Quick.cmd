@echo off
title 
:: variables
SET odrive=%odrive:~0,2%
set backupcmd=xcopy /s /c /d /e /h /i /r /y
echo off
%backupcmd% "%USERPROFILE%\desktop" "%drive%\CopiedFiles\Desktop"
%backupcmd% "%USERPROFILE%\pictures" "%drive%\CopiedFiles\Pictures"
%backupcmd% "%USERPROFILE%\Favorites" "%drive%\CopiedFiles\Favorites"
%backupcmd% "%USERPROFILE%\videos" "%drive%\CopiedFiles\Videos"
%backupcmd% "%USERPROFILE%\documents" "%drive%\CopiedFiles\Documents"
%backupcmd% "%USERPROFILE%\music" "%drive%\CopiedFiles\Music"
(
echo Desktop Apps
dir %userprofile%\Desktop
echo.
) > "%drive%\CopiedFiles-%userdomain%\DesktopAppst.txt"
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
compact /c /s CopiedFiles
@echo off 
cls