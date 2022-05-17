@echo off

tasklist /fi "ImageName eq WsaService.exe" /fo csv 2>NUL | find /I "WsaService.exe">NUL
if "%ERRORLEVEL%"=="0"  (goto :main)  else (goto :nowsa)

:main
timeout 2 > nul
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
echo.
echo Voila! WSA is Running ...
echo.
(set /p wsaport= ) < port.txt
.\adb.exe start-server > nul
echo.
.\adb.exe connect localhost:%wsaport%
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
if /i "%number%" == "1" goto :pushfile
if /i "%number%" == "2" goto :pullfile
if /i "%number%" == "3" goto :installapk
if /i "%number%" == "4" goto :configrun
if /i "%number%" == "5" goto :exitmain


:nowsa
timeout 2 > nul
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
echo *                WSA is not running                *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo *          Start WSA and Run Script again          *
ping localhost -n 1> nul
echo *                                                  *
ping localhost -n 1> nul
echo ****************************************************
echo.
echo Press any key to exit.
pause > nul
exit /b


:pushfile
timeout 1 > nul
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
echo.
set /p winpath=Enter path or Drag and drop file here:
echo.
.\adb.exe push %winpath% "/storage/emulated/0/Windows"
echo.
echo File saved to "Windows" folder in WSA.
pause
cls
goto :main


:pullfile
timeout 1 > nul
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
echo ****************************************************
echo.
echo Enter path of file from WSA. For Example: Download/image.png. Don't include "/storage/emulated/0/"
echo.
set /p wsapath=Enter here:
.\adb.exe pull "/storage/emulated/0/%wsapath%" ".\WSA Files"
echo.
echo File saved to folder "WSA Files".
echo.
pause
cls
goto :main


:installapk
timeout 1 > nul
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
echo.
set /p apkpath=Enter path or Drag and drop .apk file:
echo.
.\adb.exe install %apkpath%
pause
cls
goto :main


:configrun
timeout 1 > nul
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
echo READ THIS CAREFULLY ...
echo.
echo This is one time configuration for WSA.
echo.
echo If you Run this file again, this will delete the previous config.
echo.
echo So, don't run this unless you need to change.
echo.
mkdir ".\WSA Files" > nul
break>.\port.txt
echo Port number can be found in Windows Subsystem for Android Settings. See the IP address under Developer Options.
echo.
echo "ADB can be connected to 127.0.0.1:PORT". It is a 5-digit number.
echo.
set /p wsaport=Enter Port here:
(echo=%wsaport%) >> port.txt
echo.
.\adb shell mkdir -m 777 /storage/emulated/0/Windows > nul
echo.
echo Files from WSA will be saved in folder "WSA Files" in current directory.
echo.
echo Windows files will be saved to "Windows" folder in WSA.
echo.
echo Configuration Completed.
pause
cls
goto :main


:exitmain

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
echo Press any key to exit...
pause > nul
exit /b
