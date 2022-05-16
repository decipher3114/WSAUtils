@echo off

echo ****************************************************
echo *              Configuration Scipt                 *
echo ****************************************************
echo.
echo READ THIS CAREFULLY
echo.
echo This is one time setup for WSA.
echo.
echo If you Run this file again, this will delete the previous config.
echo.
echo So, don't run this unless you need to change.

break>.\variables.txt
set /p port=Enter WSA port number here:
(echo=%port%) >> port.txt


tasklist /fi "ImageName eq WsaClient.exe" /fo csv 2>NUL | find /I "WsaClient.exe">NUL
if "%ERRORLEVEL%"=="0"  (goto :continue)  else (echo WSA is not running.
echo Press any key to exit ...
pause >nul
exit /b)

:continue
.\adb.exe kill-server
echo.
.\adb.exe start-server
echo.
.\adb.exe connect localhost:%port%
echo.
.\adb shell mkdir -m 777 /storage/emulated/0/
.\adb shell mkdir /storage/emulated/0/Windows
echo.
echo.
echo Files from WSA will be saved in folder "WSA Files" in current directory.
echo.
echo Windows files will be saved to "Windows" folder in WSA.
echo.
echo Setup Completed ...
echo.
echo Press any key to exit ...
pause >nul
exit /b
