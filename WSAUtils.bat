@echo off

setlocal EnableDelayedExpansion

tasklist /fi "ImageName eq WsaService.exe" /fo csv 2>NUL | find /I "WsaService.exe">NUL
if "%ERRORLEVEL%"=="0"  (goto :start)  else (goto :tryagain)

:start
break>.\logs.txt
echo ****************************************************
echo *                                                  *
echo *                    WSA Utils                     *
echo *                                                  *
echo *                 by decipher3114                  *
echo *                                                  *
echo *            github.com/decipher3114               *
echo *                                                  *
echo ****************************************************


echo Voila! WSA is Running ...
echo.
echo What do you want to do?
echo.
echo 1. Send file to WSA
echo 2. Fetch file from WSA
echo 3. Install Apk
echo 4. Configure Script
echo 5. Exit
echo.
set /p number= Enter number:
cls
if /i "%number%" == "1" goto :push
if /i "%number%" == "2" goto :pull
if /i "%number%" == "3" goto :install
if /i "%number%" == "4" goto :config
if /i "%number%" == "5" goto :exit

:tryagain
echo ****************************************************
echo *                                                  *
echo *                    WSA Utils                     *
echo *                                                  *
echo *                 by decipher3114                  *
echo *                                                  *
echo ****************************************************
echo *                                                  *
echo *          Start WSA and Run Script again          *
echo *                                                  *
echo ****************************************************
echo.
echo Press any key to exit.
pause >nul
exit /b

:push
echo ****************************************************
echo *                                                  *
echo *                    WSA Utils                     *
echo *                                                  *
echo *                 by decipher3114                  *
echo *                                                  *
echo ****************************************************
echo *                                                  *
echo *               Push files to WSA                  *
echo *                                                  *
echo ****************************************************

(set /p port= ) < port.txt

set /p path=Enter path or Drag and drop file here:

.\adb.exe start-server
echo.
.\adb.exe connect localhost:%port% >.\logs.txt
echo.
.\adb.exe push %path% /storage/emulated/0/Windows  >.\logs.txt
echo.
echo File saved to "Windows" folder in WSA.
echo.
pause
cls
goto :start

:pull
echo ****************************************************
echo *                                                  *
echo *                    WSA Utils                     *
echo *                                                  *
echo *                 by decipher3114                  *
echo *                                                  *
echo ****************************************************
echo *                                                  *
echo *              Pull files from WSA                 *
echo *                                                  *
echo ****************************************************


(set /p port= ) < port.txt
echo.
echo Enter path of file from WSA. For Example: Download/image.png. Don't include "/storage/emulated/0/"
echo.
set /p path=Enter here:

.\adb.exe start-server >.\logs.txt
echo.
.\adb.exe connect localhost:%port% >.\logs.txt
echo.
.\adb.exe pull /storage/emulated/0/%path% ".\WSA Files" >.\logs.txt
echo.
echo File saved to folder "WSA Files".
echo.
pause
cls
goto :start

:install
echo ****************************************************
echo *                                                  *
echo *                    WSA Utils                     *
echo *                                                  *
echo *                 by decipher3114                  *
echo *                                                  *
echo ****************************************************
echo *                                                  *
echo *               Install App to WSA                 *
echo *                                                  *
echo ****************************************************


(set /p port= ) < port.txt

set /p apk=Enter path or Drag and drop .apk file:

.\adb.exe start-server >.\logs.txt
echo.
.\adb.exe connect localhost:%port% >.\logs.txt
echo.
.\adb.exe install %apk%
pause
cls
goto :start


:config
echo ****************************************************
echo *                                                  *
echo *                    WSA Utils                     *
echo *                                                  *
echo *                 by decipher3114                  *
echo *                                                  *
echo ****************************************************
echo *                                                  *
echo *                  Configuration                   *
echo *                                                  *
echo ****************************************************
echo.
echo READ THIS CAREFULLY
echo.
echo This is one time configuration for WSA.
echo.
echo If you Run this file again, this will delete the previous config.
echo.
echo So, don't run this unless you need to change.

mkdir ".\WSA Files"
break>.\port.txt
set /p port=Enter WSA port number here:
(echo=%port%) >> port.txt

.\adb.exe kill-server >.\logs.txt
echo.
.\adb.exe start-server >.\logs.txt
echo.
.\adb.exe connect localhost:%port% >.\logs.txt
echo.
.\adb shell mkdir -m 777 /storage/emulated/0/ >.\logs.txt
.\adb shell mkdir /storage/emulated/0/Windows >.\logs.txt
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
exit /b
