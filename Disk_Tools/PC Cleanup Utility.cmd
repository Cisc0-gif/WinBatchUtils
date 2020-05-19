@echo off
title PC Cleanup Utility http://www.youtube.com/user/techki-tv
net session >nul 2>&1
if %errorlevel% == 0 (
goto menu
) else (
color c
echo :ERROR:Run Script as Administrator
echo.
pause
exit
)
:menu
cls
echo --------------------------------------------------------------------------------
echo PC Cleanup Utility
echo --------------------------------------------------------------------------------
echo.
echo Select a tool
echo =============
echo.
echo [1] Delete Internet Cookies
echo [2] Delete Temporary Internet Files
echo [3] Disk Cleanup
echo [4] Disk Defragment
echo [5] Disk Diagnostic
echo [6] File Organizer
echo [7] Desktop Application List Maker
echo [8] Thumb Drive Backup
echo [9] Exit
echo.
set /p op=Run:
if %op%==1 goto 1
if %op%==2 goto 2
if %op%==3 goto 3
if %op%==4 goto 4
if %op%==5 goto 5
if %op%==6 goto 6
if %op%==7 goto 7
if %op%==8 goto 8
if %op%==9 goto exit
goto error
:1
cls
echo --------------------------------------------------------------------------------
echo Delete Internet Cookies
echo --------------------------------------------------------------------------------
echo.
echo Deleting Cookies...
ping localhost -n 3 >nul
del /f /q "%userprofile%\Cookies\*.*"
cls
echo --------------------------------------------------------------------------------
echo Delete Internet Cookies
echo --------------------------------------------------------------------------------
echo.
echo Cookies deleted.
echo.
echo Press any key to return to the menu. . .
pause >nul
goto menu
:2
cls
echo --------------------------------------------------------------------------------
echo Delete Temporary Internet Files
echo --------------------------------------------------------------------------------
echo.
echo Deleting Temporary Files...
ping localhost -n 3 >nul
del /f /q "%userprofile%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*"
cls
echo --------------------------------------------------------------------------------
echo Delete Temporary Internet Files
echo --------------------------------------------------------------------------------
echo.
echo Temporary Internet Files deleted.
echo.
echo Press any key to return to the menu. . .
pause >nul
goto menu
:3
cls
echo --------------------------------------------------------------------------------
echo Disk Cleanup
echo --------------------------------------------------------------------------------
echo.
echo Running Disk Cleanup...
ping localhost -n 3 >nul
cleanmgr
WSReset.exe
ipconfig /flushdns
if exist "C:\WINDOWS\temp"del /f /q "C:WINDOWS\temp\*.*"
if exist "C:\WINDOWS\tmp" del /f /q "C:\WINDOWS\tmp\*.*"
if exist "C:\tmp" del /f /q "C:\tmp\*.*"
if exist "C:\temp" del /f /q "C:\temp\*.*"
if exist "%temp%" del /f /q "%temp%\*.*"
if exist "%tmp%" del /f /q "%tmp%\*.*"
if not exist "C:\WINDOWS\Users\*.*" goto skip
if exist "C:\WINDOWS\Users\*.zip" del "C:\WINDOWS\Users\*.zip" /f /q
if exist "C:\WINDOWS\Users\*.exe" del "C:\WINDOWS\Users\*.exe" /f /q
if exist "C:\WINDOWS\Users\*.gif" del "C:\WINDOWS\Users\*.gif" /f /q
if exist "C:\WINDOWS\Users\*.jpg" del "C:\WINDOWS\Users\*.jpg" /f /q
if exist "C:\WINDOWS\Users\*.png" del "C:\WINDOWS\Users\*.png" /f /q
if exist "C:\WINDOWS\Users\*.bmp" del "C:\WINDOWS\Users\*.bmp" /f /q
if exist "C:\WINDOWS\Users\*.avi" del "C:\WINDOWS\Users\*.avi" /f /q
if exist "C:\WINDOWS\Users\*.mpg" del "C:\WINDOWS\Users\*.mpg" /f /q
if exist "C:\WINDOWS\Users\*.mpeg" del "C:\WINDOWS\Users\*.mpeg" /f /q
if exist "C:\WINDOWS\Users\*.ra" del "C:\WINDOWS\Users\*.ra" /f /q
if exist "C:\WINDOWS\Users\*.ram" del "C:\WINDOWS\Users\*.ram"/f /q
if exist "C:\WINDOWS\Users\*.mp3" del "C:\WINDOWS\Users\*.mp3" /f /q
if exist "C:\WINDOWS\Users\*.mov" del "C:\WINDOWS\Users\*.mov" /f /q
if exist "C:\WINDOWS\Users\*.qt" del "C:\WINDOWS\Users\*.qt" /f /q
if exist "C:\WINDOWS\Users\*.asf" del "C:\WINDOWS\Users\*.asf" /f /q
:skip
if not exist C:\WINDOWS\Users\Users\*.* goto skippy /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.zip del C:\WINDOWS\Users\Users\*.zip /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.exe del C:\WINDOWS\Users\Users\*.exe /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.gif del C:\WINDOWS\Users\Users\*.gif /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.jpg del C:\WINDOWS\Users\Users\*.jpg /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.png del C:\WINDOWS\Users\Users\*.png /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.bmp del C:\WINDOWS\Users\Users\*.bmp /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.avi del C:\WINDOWS\Users\Users\*.avi /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.mpg del C:\WINDOWS\Users\Users\*.mpg /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.mpeg del C:\WINDOWS\Users\Users\*.mpeg /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.ra del C:\WINDOWS\Users\Users\*.ra /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.ram del C:\WINDOWS\Users\Users\*.ram /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.mp3 del C:\WINDOWS\Users\Users\*.mp3 /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.asf del C:\WINDOWS\Users\Users\*.asf /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.qt del C:\WINDOWS\Users\Users\*.qt /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.mov del C:\WINDOWS\Users\Users\*.mov /f /q
:skippy
if exist "C:\WINDOWS\ff*.tmp" del C:\WINDOWS\ff*.tmp /f /q
if exist C:\WINDOWS\ShellIconCache del /f /q "C:\WINDOWS\ShellI~1\*.*"
cls
echo --------------------------------------------------------------------------------
echo Disk Cleanup
echo --------------------------------------------------------------------------------
echo.
echo Disk Cleanup successful!
echo.
pause
goto menu
:4
cls
echo --------------------------------------------------------------------------------
echo Disk Defragment
echo --------------------------------------------------------------------------------
echo.
echo Defragmenting hard disks...
ping localhost -n 3 >nul
defrag -c -v
cls
echo --------------------------------------------------------------------------------
echo Disk Defragment
echo --------------------------------------------------------------------------------
echo.
echo Disk Defrag successful!
echo.
pause
goto menu
:error
cls
echo Command not recognized.
ping localhost -n 4 >nul
goto menu
:5
cls
echo --------------------------------------------------------------------------------
echo Disk Diagnostic
echo --------------------------------------------------------------------------------
echo.
echo Running Complete Disk Scan and Optimizing Volumes...
timeout 3 >nul
defrag C: /u
defrag C: /x /u
defrag C: /g /u
chkdsk /f /r /scan
sfc /scannow
cd "%programfiles%\Windows Defender"
mpcmdrun.exe scan -2
mpcmdrun.exe trace
mpcmdrun.exe getfiles -scan
cls
echo --------------------------------------------------------------------------------
echo Disk Diagnostic
echo --------------------------------------------------------------------------------
echo.
echo Disk Diagnosis successful!
echo.
pause
goto menu
:6
cls
echo Organizing Files
for %%a in (".\*") do (
if "%%~xa" NEQ ""  if "%%~dpxa" NEQ "%~dpx0" (
if not exist "%%~xa" mkdir "%%~xa"
move "%%a" "%%~dpa%%~xa\"
))
echo System Organized
echo.
goto menu
:7
cls
echo --------------------------------------------------------------------------------
echo Desktop App List Generator
echo --------------------------------------------------------------------------------
echo.
(
echo Desktop Apps
dir %userprofile%\Desktop
echo.
) > "%userprofile%\Desktop\Apps.txt"
(
echo Program Files
dir "C:\Program Files"
echo.
) >> "%userprofile%\Desktop\Apps.txt"
(
echo Program Files x86
dir "C:\Program Files (x86)"
echo.
) >> "%userprofile%\Desktop\Apps.txt"
cls
echo --------------------------------------------------------------------------------
echo Desktop App List Generator
echo --------------------------------------------------------------------------------
echo.
echo List Created on Desktop!
echo.
pause
goto menu
:8
cls
echo --------------------------------------------------------------------------------
echo Thumb Drive Backup
echo --------------------------------------------------------------------------------
echo.
set /p thumb="Enter drive letter: "
xcopy /s /c /d /e /h /i /r /y "%userprofile%\Desktop\CodeRep\Scripts\Batch_Scripts\SystemFileCopy-Custom.cmd" %thumb%:
%thumb%:
SystemFileCopy-Custom.cmd
C:
cls
echo --------------------------------------------------------------------------------
echo Thumb Drive Backup
echo --------------------------------------------------------------------------------
echo.
echo Backup Complete!
pause
goto menu
:exit
echo Thanks for using PC Cleanup Utility
ping 127.0.0.1 >nul
exit