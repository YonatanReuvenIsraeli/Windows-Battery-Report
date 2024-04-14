@echo off
setlocal
title Windows Battery Report
echo Windows Battery Report v1.0.5
echo.
echo Press any key to start.
pause > nul
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
