@echo off
echo ****************************************************
echo *               Pull files from WSA                *
echo ****************************************************

(
   set /p port=

) < port.txt


tasklist /fi "ImageName eq WsaClient.exe" /fo csv 2>NUL | find /I "WsaClient.exe">NUL
if "%ERRORLEVEL%"=="0"  (goto :continue)  else (echo WSA is not running.
echo Turn on WSA first
echo Press any key to exit ...
pause >nul
exit /b)

:continue
echo WSA is running.
echo.
echo Enter path of file from WSA. For Example: Download/image.png. Don't include "/storage/emulated/0/"
set /p path=Enter here:

.\adb.exe start-server
echo.
.\adb.exe connect localhost:%port%
echo.
.\adb.exe pull /storage/emulated/0/%path% ".\WSA Files"
echo.
echo File successfully saved to folder "WSA Files".
echo.
echo Press any key to exit ...
pause >nul
exit /b