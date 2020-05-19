@echo off
title Alternate DNS Set-Up
netsh interface show interface
set /p netCard="Enter your Network Interface Card Name: "
set /p dnsAddress="Enter your primary DNS IP: "
set /p dnsAddress2="Enter your secondary DNS IP: "
netsh interface ip set dns name="%netCard%" source="static" address="%dnsAddress%" primary validate=no
netsh interface ip add dns name="%netCard%" address="%dnsAddress2%" index=2
ping google.com
tracert google.com
exit