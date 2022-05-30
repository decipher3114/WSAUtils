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
.\adb.exe start-server
.\adb.exe devices
echo What do you want to do?
echo.
echo 1. Send file to WSA
echo 2. Fetch file from WSA
echo 3. Install Apk
echo 4. Configure Script
echo 5. Exit
echo.
choice /C 12345 /N /M "What do you want to do?"
cls
goto menu%errorlevel%


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


:menu1
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


:menu2
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
goto :opt1


:opt1
echo *************************************
echo *               list                *
echo *************************************
echo.
.\adb shell ls /storage/emulated/0/Windows
echo.
echo *************************************
echo.
echo This is list of file of Windows folder from WSA. If your file is not here, move it to Windows folder in WSA and refresh.
echo.
choice /C rc /N /M "Press 'C' to continue or 'R' to refresh"
goto opt%errorlevel%



:opt2
echo.
set /p wsapath=Enter here:
.\adb.exe pull "/storage/emulated/0/Windows/%wsapath%" ".\WSA Files"
echo.
echo File saved to folder "WSA Files".
echo.
pause
cls
goto :main


:menu3
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


:menu4
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


:menu5

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
