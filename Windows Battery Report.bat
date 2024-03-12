@echo off
setlocal
title CMD Windows Battery Report
echo Please run this batch file as an administrator.
goto :Start

:Start
cd /d %SystemDrive%
cd\
powercfg /batteryreport
goto :Open

:Open
"%SystemDrive%\battery-report.html"
del "%SystemDrive%\battery-report.html" /f /q
goto :Done

:Done
echo.
echo Press any key to close this batch file.
pause >nul
exit