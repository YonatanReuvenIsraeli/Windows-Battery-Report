@echo off
setlocal
title Windows Battery Report
echo Program Name: Windows Battery Report
echo Version: 1.2.13
echo License: GNU General Public License v3.0
echo Developer: @YonatanReuvenIsraeli
echo GitHub: https://github.com/YonatanReuvenIsraeli
echo Sponsor: https://github.com/sponsors/YonatanReuvenIsraeli
"%windir%\System32\net.exe" user > nul 2>&1
if not "%errorlevel%"=="0" goto "InWindowsPreinstallationEnvironmentWindowsRecoveryEnvironment"
echo.
echo Press any key to get a Windows battery report.
pause > nul 2>&1
goto "Start"

:"InWindowsPreinstallationEnvironmentWindowsRecoveryEnvironment"
echo.
echo You are in Windows Preinstallation Environment or Windows Recovery Environment! You must run this batch file in Windows. Press any key to close this batch file.
pause > nul 2>&1
goto "Done"

:"Start"
cd /d "%SystemDrive%"
cd\
cd "%USERPROFILE%"
goto "BatteryReportSet"

:"BatteryReportSet"
set BatteryReport=
goto "BatteryReport"

:"BatteryReport"
if exist "battery-report.html" goto "BatteryReportExist"
"%windir%\System32\powercfg.exe" /batteryreport > nul 2>&1
if not "%errorlevel%"=="0" goto "NoBattery"
"battery-report.html"
del "battery-report.html" /f /q > nul 2>&1
if not "%errorlevel%"=="0" goto "DidNotDelete"
if "%BatteryReport%"=="True" goto "BatteryReportDone"
goto "Close"

:"BatteryReportExist"
set BatteryReport=True
echo.
echo Please temporary rename to something else or temporary move to another location "battery-report.html" in order for this batch file to proceed. "battery-report.html" is not a system file. "battery-report.html" is located in the folder you ran this batch file from. Press any key to continue when "battery-report.html" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "BatteryReport"

:"NoBattery"
echo There is no battery on this PC! Press any key to close this batch file.
pause > nul 2>&1
goto "Done"

:"DidNotDelete"
echo.
echo Error deleting battery report file ("battery-report.html")! Battery report file ("battery-report.html") was located in the folder you ran this batch file from. It may have already been deleted.
goto "Close"

:"BatteryReportDone"
echo.
echo You can now rename or move back the file back to "battery-report.html" Press any key to close this batch file.
pause > nul 2>&1
goto "Done"

:"Close"
echo.
echo Press any key to close this batch file.
pause > nul 2>&1
goto "Done"

:"Done"
endlocal
exit
