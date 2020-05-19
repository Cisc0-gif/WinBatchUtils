@echo off
title Network Diagnostic

set Interface_Reset="netsh interface ip reset"
set DNS_Cache_Flush="ipconfig /flushdns"
set DNS_Cache_Register="ipconfig /registerdns"
set Ping_Loopback="ping 127.0.0.1"
set Trace_Loopback="tracert 127.0.0.1"
set Test_Connection1="ping google.com"
set Test_Connection2="tracert google.com"
set Proxy_Config="netsh winhttp set proxy proxy-server="http=144.202.65.55:3128;https=144.202.65.55:3128"

net session >nul 2>&1
if "%errorlevel%"=="0" ( 
goto processes
) else (
color c
echo :ERROR: Run as Administrator.
pause
exit
)

:processes
"%Test_Connection1%"
"%Test_Connection2%"
"%Interface_Reset%"
"%DNS_Cache_Flush%"
"%Ping_Loopback%"
"%Trace_Loopback%"
(
echo Current Network IP Addresses
echo ============================
arp -av
) > "%userprofile%\Desktop\IPAddresses.txt"
(
echo Router IP Address
echo =================
echo.
netsh interface ip show config |findstr /C:"Default Gateway:"
echo.
echo Enter the IP above into your browser to access your routers system menu.
echo ========================================================================
) > "%userprofile%\Desktop\RouterIP.txt"
(
echo System Network Configurations
echo =============================
netsh interface ip show config
echo.
echo RDP Connectable Computers
echo =============================
net view
) > "%userprofile%\Desktop\NetworkInfo.txt"
cd %userprofile%\Desktop\CodeRep\Scripts\Batch_Scripts
set /p dns="Do you want to configure a DNS Server to a Network Interface?[Y/N]: "
if "%dns%"=="Y" (
call "Alternate DNS Set-Up.cmd" 
goto exit
)
if "%dns%"=="N" goto exit

:exit
echo After proxy is setup go to settings to enable 'Use a Proxy Server'
"%Proxy_Config%"
pause
"%Test_Connection1%"
"%Test_Connection2%"
"%DNS_Cache_Register%"
pause
exit
