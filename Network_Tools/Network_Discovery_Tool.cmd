@echo off
title Network Settings
net session >nul 2>&1
if %errorlevel% == 0 (
goto menu
) else (
goto error
)

:error
color 4
echo :ERROR: Run As Administrator!
pause
exit

:menu
color 2
echo "SUCCESS: User Is Admin!"
color 0F
set /p prompt="Network Discovery and File Sharing [O]n or Of[f]?: "
if prompt=="O" (
netsh advfirewall firewall set rule group="Network Discovery" new enable=yes
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=yes
echo Network Discovery and File and Printer Sharing Enabled!
pause
exit
) else (
netsh advfirewall firewall set rule group="Network Discovery" new enable=yes
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=yes
echo Network Discovery and File and Printer Sharing Disabled!
pause
exit
)