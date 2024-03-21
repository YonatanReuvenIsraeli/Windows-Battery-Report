@echo off
setlocal
title CMD Windows Battery Report
echo Please run this batch file as an administrator. Press any key to start.
pause >nul
goto Start

:Start
cd /d %SystemDrive%
cd\
cd Users\c%USERNAME%
powercfg /batteryreport
goto Open

:Open
"%SystemDrive%\Users\%USERNAMER%\battery-report.html"
del "%SystemDrive%\Users\%USERNAME%\battery-report.html" /f /q
goto Done

:Done
echo.
echo Press any key to close this batch file.
pause >nul
exit
