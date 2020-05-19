@echo off

echo " __  __          _           ____     ____                             __               "
echo "|  \/  |  _     / \     _   / ___|   / ___|   _ __     ___     ___    / _|   ___   _ __ "
echo "| |\/| | (_)   / _ \   (_) | |       \___ \  | '_ \   / _ \   / _ \  | |_   / _ \ | '__|"
echo "| |  | |  _   / ___ \   _  | |___     ___) | | |_) | | (_) | | (_) | |  _| |  __/ | |   "
echo "|_|  |_| (_) /_/   \_\ (_)  \____|   |____/  | .__/   \___/   \___/  |_|    \___| |_|   "
echo "                                             |_|                                        "
echo ==========================================================================================
echo Listed are your network drivers and interfaces. Scroll through each one and find your 
echo interface you want to spoof. Once found, type 'reg add 
echo HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002BE10318}\
echo (FILENAME) /v "NetworkAddress" /d "(SPOOFED MAC ADDRESS)"'
echo MAC Addresses must start with D2XXXXXXXXXX, D6XXXXXXXXXX, DAXXXXXXXXXX, or DEXXXXXXXXXX formats. 
echo Once complete, restart and type 'ipconfig /all' to check adapter's 'Physical Address'. 
echo As a possible trouble shooting solution, save your interfaces original MAC Addresses somewhere.
echo ==========================================================================================
ipconfig /all |findstr /C:"Description" & ipconfig /all |findstr /C:"Physical Address"
timeout 3 >nul
reg query HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002BE10318}
pause
cmd
