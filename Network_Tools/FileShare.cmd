:: Name:      FileShare.cmd
:: Purpose:   To create network file shares.
:: Author:    fergo310@yahoo.com
:: Revision:  

@echo off
title FileShare v1.0
:home
cls
echo "=========================================================================================="
echo " ________   __   __              _________   __                                           "
echo "|   _____| |__| |  |  ________  |  _______| |  |       _______      _____   ________      "
echo "|  |_____   __  |  | |  ____  | | |         |  |      /  ___  \    /  _  \ |   __   |     "
echo "|   _____| |  | |  | | |____| | | |_______  |  |____  | |   | |    | | |_| |  |___| |     "
echo "|  |       |  | |  | |   _____| |______   | |   _   | | |   |  \   | |     |   _____|     "
echo "|  |       |  | |  | |  |_____   ______|  | |  | |  | | |___|   \  | |     |  |_____      "
echo "|__|       |__| |__| |________| |_________| |__| |__| \_______/\_| |_|     |________| v1.0"
echo "=========================================================================================="
echo [1]Create Share
echo [2]Delete Share
echo [3]About
echo [4]Exit
set /p op="Enter option: "
if "%op%"=="1" goto 1
if "%op%"=="2" goto 2
if "%op%"=="3" goto 3
if "%op%"=="4" exit

:1
cls
echo ===========================
echo Network File Share Creator
echo ===========================
set /p filepath="Enter full filepath: "
set /p s_name="Enter share name: "
net share "%s_name%"="%filepath%"
timeout 3 >nul
echo Share "%s_name%" created!
pause
goto home

:2
cls
echo ===========================
echo Network File Share Deleter
echo ===========================
net share
set /p d_name="Enter share name: "
net share %d_name% /delete
timeout 3 >nul
echo Share "%d_name%" deleted!
pause
goto home

:3
cls
echo =======================================================
echo FileShare v1.0 was created to easily share files on
echo your network with other computers locally. Wether 
echo working on projects, work, or just simply sending
echo images, FileShare is the easy way to go.
echo =======================================================
pause
goto home