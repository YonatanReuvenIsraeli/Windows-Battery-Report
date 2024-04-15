@echo off
setlocal
title Windows Battery Report
echo Program Name: Windows Battery Report
echo Version: 1.1.0
echo Developer: @YonatanReuvenIsraeli
echo Website: https://www.yonatanreuvenisraeli.dev
echo License: GNU General Public License v3.0
echo.
echo Press any key to start.
pause > nul 2>&1
goto Start

:Start
cd /d "%SystemDrive%"
cd\
cd "%USERPROFILE%"
powercfg /batteryreport
goto Open

:Open
"%USERPROFILE%\battery-report.html"
del "%USERPROFILE%\battery-report.html" /f /q
goto Done

:Done
echo.
echo Press any key to close this batch file.
pause > nul
exit
