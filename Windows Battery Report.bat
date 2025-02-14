@echo off
title Windows Battery/Energy Report
setlocal
echo Program Name: Windows Battery/Energy Report
echo Version: 2.0.1
echo License: GNU General Public License v3.0
echo Developer: @YonatanReuvenIsraeli
echo GitHub: https://github.com/YonatanReuvenIsraeli
echo Sponsor: https://github.com/sponsors/YonatanReuvenIsraeli
"%windir%\System32\net.exe" session > nul 2>&1
if not "%errorlevel%"=="0" goto "NotAdministrator"
"%windir%\System32\net.exe" user > nul 2>&1
if not "%errorlevel%"=="0" goto "InWindowsPreinstallationEnvironmentWindowsRecoveryEnvironment"
goto "Start"

:"NotAdministrator"
echo.
echo Please run this batch file as an administrator. Press any key to close this batch file.
pause > nul 2>&1
goto "Close"

:"InWindowsPreinstallationEnvironmentWindowsRecoveryEnvironment"
echo.
echo You are in Windows Preinstallation Environment or Windows Recovery Environment! You must run this batch file in Windows. Press any key to close this batch file.
pause > nul 2>&1
goto "Done"

:"Start"
echo.
set BatteryEnergy=
set /p BatteryEnergy="Do you want a battery or energy report? (Battery/Energy) "
if /i "%BatteryEnergy%"=="Battery" goto "PathSet"
if /i "%BatteryEnergy%"=="Energy" goto "PathSet"
echo Invalid syntax!
goto "Start"

:"PathSet"
cd /d "%SystemDrive%"
cd\
cd "%USERPROFILE%"
if /i "%BatteryEnergy%"=="Battery" goto "BatteryReportSet"
if /i "%BatteryEnergy%"=="Energy" goto "Duration"

:"BatteryReportSet"
set BatteryReport=
goto "BatteryReport"

:"BatteryReport"
if exist "battery-report.html" goto "BatteryReportExist"
"%windir%\System32\powercfg.exe" /batteryreport > nul 2>&1
if not "%errorlevel%"=="0" goto "NoBattery"
"battery-report.html"
del "battery-report.html" /f /q > nul 2>&1
if not "%errorlevel%"=="0" goto "DidNotDeleteBattery"
if "%BatteryReport%"=="True" goto "BatteryReportDone"
goto "Close"

:"BatteryReportExist"
set BatteryReport=True
echo.
echo Please temporarily rename to something else or temporarily move to another location "battery-report.html" in order for this batch file to proceed. "battery-report.html" is not a system file. "battery-report.html" is located in the folder you ran this batch file from. Press any key to continue when "battery-report.html" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "BatteryReport"

:"NoBattery"
echo There is no battery on this PC! Press any key to close this batch file.
pause > nul 2>&1
goto "Done"

:"DidNotDeleteBattery"
echo.
echo Error deleting battery report file ("battery-report.html")! Battery report file ("battery-report.html") was located in the folder you ran this batch file from. It may have already been deleted. Press any key to close this batch file.
goto "Done"

:"BatteryReportDone"
echo.
echo You can now rename or move back the file back to "battery-report.html" Press any key to close this batch file.
pause > nul 2>&1
goto "Done"

:"Duration"
echo.
set Duration=
set /p Duration="Enter the amount of time in seconds you want to run the energy test for. (0-?) "
if /i "%Duration%"=="" set Duration=60
goto "SureDuration"

:"SureDuration"
echo.
set SureDuration=
set /p SureDuration="Are you sure you want to run the energy test for %Duration% seconds? (Yes/No) "
if /i "%SureDuration%"=="Yes" goto "EnergyReportSet"
if /i "%SureDuration%"=="No" goto "Duration"
echo Invalid syntax!
goto "Duration"

:"EnergyReportSet"
set EnergyReport=
goto "EnergyReport"

:"EnergyReport"
if exist "energy-report.html" goto "EnergyReportExist"
"%windir%\System32\powercfg.exe" /energy /duration %Duration%
if not "%errorlevel%"=="0" goto "Error"
"energy-report.html"
del "energy-report.html" /f /q > nul 2>&1
if not "%errorlevel%"=="0" goto "DidNotDeleteEnergy"
if "%EnergyReport%"=="True" goto "EnergyReportDone"
goto "Close"

:"EnergyReportExist"
set EnergyReport=True
echo.
echo Please temporarily rename to something else or temporarily move to another location "energy-report.html" in order for this batch file to proceed. "energy-report.html" is not a system file. "energy-report.html" is located in the folder you ran this batch file from. Press any key to continue when "energy-report.html" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "EnergyReport"

:"Error"
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto ""

:"DidNotDeleteEnergy"
echo.
echo Error deleting energy report file ("energy-report.html")! Energy report file ("energy-report.html") was located in the folder you ran this batch file from. It may have already been deleted. Press any key to close this batch file.
goto "Done"

:"EnergyReportDone"
echo.
echo You can now rename or move back the file back to "energy-report.html" Press any key to close this batch file.
pause > nul 2>&1
goto "Done"

:"Done"
endlocal
exit
