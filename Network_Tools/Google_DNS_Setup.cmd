@echo off
title DNS Boot Set-Up
netsh interface ip set dns name="Wi-Fi" source="static" address="8.8.8.8" primary validate=no
netsh interface ip add dns name="Wi-Fi" address="8.8.4.4" index=2
netsh winhttp set proxy proxy-server="http=144.202.65.55:3128;https=144.202.65.55:3128"
exit