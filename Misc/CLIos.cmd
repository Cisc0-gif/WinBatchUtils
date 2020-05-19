@echo off
mode 1000
:intro
echo.
echo =====================================================================================================================================================================================================
echo.
ping localhost -n 2 >nul
echo                                                                              .d8888b.  888      8888888                   
ping localhost -n 2 >nul
echo                                                                             d88P  Y88b 888        888                     
ping localhost -n 2 >nul
echo                                                                             888    888 888        888                     
ping localhost -n 2 >nul
echo                                                                             888        888        888    .d88b.  .d8888b  
ping localhost -n 2 >nul
echo                                                                             888        888        888   d88""88b 88K      
ping localhost -n 2 >nul
echo                                                                             888    888 888        888   888  888 "Y8888b. 
ping localhost -n 2 >nul
echo                                                                             Y88b  d88P 888        888   Y88..88P      X88 
ping localhost -n 2 >nul
echo                                                                              "Y8888P"  88888888 8888888  "Y88P"   88888P' v1.0
echo.
echo =====================================================================================================================================================================================================
goto home
:home
title LOG IN
color 07
cls
echo.
echo =====================================================================================================================================================================================================
time /t
date /t
echo                                                                               .d8888b.  888      8888888                   
echo                                                                              d88P  Y88b 888        888                     
echo                                                                              888    888 888        888                     
echo                                                                              888        888        888    .d88b.  .d8888b  
echo                                                                              888        888        888   d88""88b 88K      
echo                                                                              888    888 888        888   888  888 "Y8888b. 
echo                                                                              Y88b  d88P 888        888   Y88..88P      X88 
echo                                                                               "Y8888P"  88888888 8888888  "Y88P"   88888P' v1.0
echo.
echo =====================================================================================================================================================================================================
echo.
echo                                                                                               [1] Log In
echo                                                                                               [2] Sign Up
echo                                                                                               [3] Exit
set /p op=": "
if %op%==1 goto 1
if %op%==2 goto 2
if %op%==3 goto 3
goto error
:2
cls
echo Account Creator
echo =================
echo.
set /p newname="Enter new username: "
goto inputname
:inputname
cd "%userprofile%\Documents"
if exist "%userprofile%\Documents\cmdacoBin" goto skip
if not exist "%userprofile%\Documents\cmdacoBin" md "cmdacoBin" & goto skip
:skip
cd "%userprofile%\Documents\cmdacoBin"
if exist "%newname%.bat" goto namexist
if not exist "%newname%.bat" echo set realusername="%newname% > "%newname%.bat" & goto next
:next
echo.
set /p pswd="Enter new Password: "
if "%pswd%"=="%pswd%" goto inputpass
:inputpass
cd "%userprofile%\Documents\cmdacoBin"
echo set password=%pswd%>> "%newname%.bat"
echo set fp=%newname% >> "%newname%.bat"
goto next1
:namexist
echo.
echo The entered username already exists.
echo Press any key to return. . .
pause >nul
goto 2
:next1
cls
echo Account Creator
echo =================
echo.
echo Your account has been successfully created!
echo.
pause
goto home
:1
color 07
cls
echo Login
echo =======
echo.
Set /p logname="Username: "
if "%logname%"=="%logname%" goto 2.1
:2.1
echo.
set /p logpass="Password: "
if "%logpass%"=="%logpass%" goto login
:login
cd "%userprofile%\Documents\cmdacoBin"
if exist "%logname%.bat" goto call
if not exist "%logname%.bat" goto errorlog
:call
call "%logname%.bat"
if "%password%"=="%logpass%" goto logdone
goto errorlog
:errorlog
color 0c
echo.
echo Username or Password incorrect.
echo Access denied.
pause >nul
goto home
:logdone
cls
echo Login
echo =======
echo.
echo Successfully logged in!
echo.
pause
if exist "%userprofile%\Documents\cmdacoBin\%logname%" goto account
if not exist "%userprofile%\Documents\cmdacoBin\%logname%" md "%userprofile%\Documents\cmdacoBin\%logname%" & goto account
:account
cls
cd "%userprofile%\Documents\cmdacoBin"
call "%realusername%color.bat"
call "%realusername%.bat"
color %colorcode%
cls
echo.
echo -------------------------------------------------------------------------------
echo %realusername%
echo -------------------------------------------------------------------------------
@echo off
break off
Title Command Prompt
color 0a
cls

echo Type "home" any time to go to the current user profile directory.
echo Type "signout" any time to signout of account.
echo Type "desktop" any time to go to the current user desktop.
echo Type "storage" any time to view freespace and size of drives (in bytes).
echo Type "networks" any time to view networks in your area.
echo Type "networkprofiles" any time to view network profiles stored.
echo Type "time" any time to view current time
echo Type "date" any time to view current date
echo.
echo Type "help" to see list of common commands like cd, rd, md, del,
echo ren, replace, copy, xcopy, move, attrib, tree, edit, and cls.
echo Type [command] /? for detailed info.
echo.
pause
cls

:cmd
echo Directory: %CD%
set /P CMD="Command: "
if "%CMD%" == "cls" goto cls
if "%CMD%" == "home" goto home2
if "%CMD%" == "desktop" goto desktop
if "%CMD%" == "signout" goto home
if "%CMD%" == "storage" goto storage
if "%CMD%" == "networks" goto networks
if "%CMD%" == "networkprofiles" goto networkprofiles
if "%CMD%" == "time" 
if "%CMD%" == "date" date /t
if "%CMD%" == "red" goto red
if "%CMD%" == "green" goto green
if "%CMD%" == "normal" goto normal

%CMD%
cd /d %CD%
goto cmd

:cls
cls
goto cmd

:home2
cd /d %userprofile%\Documents\cmdacoBin\%logname%
cls
goto cmd

:desktop
cd /d %userprofile%\Desktop
cls
goto cmd

:red
color 0c
cls
goto cmd

:green
color 0a
cls
goto cmd

:normal
color 07
cls
goto cmd

:storage
wmic logicaldisk get name,size,freespace
goto cmd

:networks
netsh wlan show networks
goto cmd

:networkprofiles
netsh wlan show profiles
goto cmd