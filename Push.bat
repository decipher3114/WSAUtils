@echo off
echo ****************************************************
echo *               Push files to WSA                  *
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
echo WSA is running.
echo ********
set /p path=Enter path or Drag and drop file here:

.\adb.exe start-server
echo.
.\adb.exe connect localhost:%port%
echo.
.\adb.exe push %path% /storage/emulated/0/Windows
echo.
echo File successfully saved to "Windows" folder in WSA.
echo.
echo Press any key to exit ...
pause >nul
exit /b