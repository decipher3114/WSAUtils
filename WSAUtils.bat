@echo off

setlocal EnableDelayedExpansion

tasklist /fi "ImageName eq WsaService.exe" /fo csv 2>NUL | find /I "WsaService.exe">NUL
if "%ERRORLEVEL%"=="0"  (goto :start)  else (goto :retry)

:start
timeout 2 >nul
echo ****************************************************
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo *                    WSA Utils                     *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo *                 by decipher3114                  *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo *            github.com/decipher3114               *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo ****************************************************


ping localhost -n 1> nul
echo Voila! WSA is Running ...
ping localhost -n 1> nul
echo.
ping localhost -n 1> nul
echo What do you want to do?
ping localhost -n 1> nul
echo.
ping localhost -n 1> nul
echo 1. Send file to WSA
ping localhost -n 1> nul
echo 2. Fetch file from WSA
ping localhost -n 1> nul
echo 3. Install Apk
ping localhost -n 1> nul
echo 4. Configure Script
ping localhost -n 1> nul
echo 5. Exit
ping localhost -n 1> nul
echo.
ping localhost -n 1> nul
set /p number= Enter number:
cls
if /i "%number%" == "1" goto :push
if /i "%number%" == "2" goto :pull
if /i "%number%" == "3" goto :install
if /i "%number%" == "4" goto :config
if /i "%number%" == "5" goto :exit

:retry
timeout 2 >nul
echo ****************************************************
echo *                                                  *
ping localhost -n 1> nul
echo *                    WSA Utils                     *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo *                 by decipher3114                  *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo ****************************************************
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo *                WSA is not running                *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo *          Start WSA and Run Script again          *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo ****************************************************
ping localhost -n 1> nul
echo.
ping localhost -n 1> nul
echo Press any key to exit.
ping localhost -n 1> nul
pause >nul
exit /b

:push
timeout 1 >nul
echo ****************************************************
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo *                    WSA Utils                     *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo *                 by decipher3114                  *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo ****************************************************
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo *               Push files to WSA                  *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo ****************************************************
ping localhost -n 1> nul

(set /p port= ) < port.txt

set /p path=Enter path or Drag and drop file here:

.\adb.exe start-server
echo.
.\adb.exe connect localhost:%port%
echo.
.\adb.exe push %path% /storage/emulated/0/Windows
echo.
echo File saved to "Windows" folder in WSA.
echo.
pause
cls
goto :start

:pull
timeout 1 >nul
echo ****************************************************
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo *                    WSA Utils                     *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo *                 by decipher3114                  *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo ****************************************************
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo *              Pull files from WSA                 *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo ****************************************************
ping localhost -n 1> nul


(set /p port= ) < port.txt
echo.
echo Enter path of file from WSA. For Example: Download/image.png. Don't include "/storage/emulated/0/"
echo.
set /p path=Enter here:

.\adb.exe start-server
echo.
.\adb.exe connect localhost:%port%
echo.
.\adb.exe pull /storage/emulated/0/%path% ".\WSA Files"
echo.
echo File saved to folder "WSA Files".
echo.
pause
cls
goto :start

:install
timeout 1 >nul
echo ****************************************************
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo *                    WSA Utils                     *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo *                 by decipher3114                  *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo ****************************************************
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo *               Install App to WSA                 *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo ****************************************************
ping localhost -n 1> nul


(set /p port= ) < port.txt

set /p apk=Enter path or Drag and drop .apk file:

.\adb.exe start-server
echo.
.\adb.exe connect localhost:%port%
echo.
.\adb.exe install %apk%
pause
cls
goto :start


:config
timeout 1 >nul
echo ****************************************************
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo *                    WSA Utils                     *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo *                 by decipher3114                  *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo ****************************************************
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo *                  Configuration                   *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo ****************************************************
ping localhost -n 1> nul
echo.
ping localhost -n 1> nul
echo READ THIS CAREFULLY
ping localhost -n 1> nul
echo.
ping localhost -n 1> nul
echo This is one time configuration for WSA.
ping localhost -n 1> nul
echo.
ping localhost -n 1> nul
echo If you Run this file again, this will delete the previous config.
ping localhost -n 1> nul
echo.
ping localhost -n 1> nul
echo So, don't run this unless you need to change.
ping localhost -n 1> nul

ping localhost -n 1> nul
mkdir ".\WSA Files" > nul
break>.\port.txt
set /p port=Enter WSA port number here:
(echo=%port%) >> port.txt

.\adb.exe kill-server > nul
echo.
.\adb.exe start-server > nul
echo.
.\adb.exe connect localhost:%port%
echo.
.\adb shell mkdir -m 777 /storage/emulated/0/Windows > nul
echo.
echo.
echo Files from WSA will be saved in folder "WSA Files" in current directory.
echo.
echo Windows files will be saved to "Windows" folder in WSA.
echo.
echo Configuration Completed.
pause
cls
goto :start


:exit
timeout 2 >nul
echo ****************************************************
echo *                                                  *
ping localhost -n 1> nul
echo *                    WSA Utils                     *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo *                 by decipher3114                  *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo ****************************************************
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo *               Thanks for using !!                *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo *                See you again                     *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo ****************************************************
ping localhost -n 1> nul
.\adb.exe kill-server
exit /b
