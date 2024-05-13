@echo off
setlocal
title Windows Battery Report
echo Program Name: Windows Battery Report
echo Version: 1.2.1
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
set BatteryReport=
if exist "%cd%\battery-report.html" goto BatteryReportExist
powercfg /batteryreport
goto Open

:BatteryReportExist
set BatteryReport=True
echo.
echo Please temporary rename to something else or temporary move to another location "%cd%\battery-report.html" in order for this batch file to proceed. Press any key to continue when "%cd%\battery-report.html" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto Start

:Open
"%USERPROFILE%\battery-report.html"
del "%USERPROFILE%\battery-report.html" /f /q
if "%BatteryReport%"=="True" goto BatteryReportDone
goto Done

:BatteryReportDone
echo.
echo You can now rename or move back the file back to "%cd%\battery-report.html"
goto Done

:Done
echo.
echo Press any key to close this batch file.
pause > nul 2>&1
exit
