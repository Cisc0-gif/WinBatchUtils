@echo off
echo """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
echo "  ____                   _      _                  _                  "
echo " / ___|   ___     ___   | | __ (_)   ___          | |   __ _   _ __   "
echo "| |      / _ \   / _ \  | |/ / | |  / _ \      _  | |  / _` | | '__|  "
echo "| |___  | (_) | | (_) | |   <  | | |  __/  _  | |_| | | (_| | | |     "
echo " \____|  \___/   \___/  |_|\_\ |_|  \___| (_)  \___/   \__,_| |_| v1.0"
echo """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
pause
echo Baking Cookie.
timeout 3 >nul

(
echo @echo off
echo echo """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
echo echo "  ____                   _      _                  _                  "
echo echo " / ___|   ___     ___   | | __ (_)   ___          | |   __ _   _ __   "
echo echo "| |      / _ \   / _ \  | |/ / | |  / _ \      _  | |  / _` | | '__|  "
echo echo "| |___  | (_) | | (_) | |   <  | | |  __/  _  | |_| | | (_| | | |     "
echo echo " \____|  \___/   \___/  |_|\_\ |_|  \___| (_)  \___/   \__,_| |_| v1.0"
echo echo """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
echo dir "%userprofile%\Cookies"
echo if "%errorlevel%"=="1" goto del
echo if "%errorlevel%"=="0" goto empty
echo :del
echo del /f /q "C:\Users\fergo\Cookies\*.*"
echo echo.
echo echo Cookies Deleted.
echo timeout 3 >nul
echo exit
echo :empty
echo echo No Cookies in Jar!
echo timeout 3 >nul
echo exit
) >> Cookie.cmd
move Cookie.cmd "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
timeout 3 >nul
echo A Cookie Was Taken Out of the Jar!
timeout 3 >nul
exit