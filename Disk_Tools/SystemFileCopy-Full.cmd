@echo off
title 
:: variables
SET odrive=%odrive:~0,2%
set backupcmd=xcopy /s /c /d /e /h /i /r /y
echo off
%backupcmd% "%USERPROFILE%\pictures" "%drive%\CopiedFiles\Pictures"
%backupcmd% "%USERPROFILE%\Favorites" "%drive%\CopiedFiles\Favorites"
%backupcmd% "%USERPROFILE%\videos" "%drive%\CopiedFiles\Videos"
%backupcmd% "%USERPROFILE%\documents" "%drive%\CopiedFiles\Documents"
%backupcmd% "%USERPROFILE%\Desktop" "%drive%\CopiedFiles\Desktop"
%backupcmd% "%USERPROFILE%\music" "%drive%\CopiedFiles\Music"
%backupcmd% "C:\Program Files" "%drive%\CopiedFiles\Program Files"
%backupcmd% "C:\Program Files (x86)" "%drive%\CopiedFiles\Program Files (x86)"
md "%drive%\System"
net user > "%drive%\System\Users.txt"
net accounts > "%drive%\System\AccountSettings.txt"
netsh wlan show profiles > "%drive%\System\NetworkProfiles.txt"
netsh interface ip show config "%drive%\System\NetworkConfig.txt"
sc query > "%drive%\System\Services.txt"
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
compact /c /s CopiedFiles
compact /c /s System
@echo off 
cls