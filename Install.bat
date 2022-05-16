@echo off
echo ****************************************************
echo *              Install Apps to WSA                 *
echo ****************************************************

(
   set /p port=

) < port.txt


tasklist /fi "ImageName eq WsaClient.exe" /fo csv 2>NUL | find /I "WsaClient.exe">NUL
if "%ERRORLEVEL%"=="0"  (goto :continue)  else (echo WSA is not running.
echo Press any key to exit ...
pause >nul
exit /b)

:continue
echo.
echo WSA is running.
echo.
set /p path=Enter path or Drag and drop .apk file:

.\adb.exe start-server
echo.
.\adb.exe connect localhost:%port%
echo.
.\adb.exe install %apk%
echo.
echo App successfully installed.
echo.
echo Press any key to exit ...
pause >nul
exit /b