@echo off
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)
:main
cls
color 0c
type Resources\debug.txt
ping localhost -n 1.9 >nul
echo.
echo  Are you sure you want to factory reset TerminalOS?
ping localhost -n 1.9 >nul
echo.
echo  1 - Yes
ping localhost -n 1.9 >nul
echo  2 - No
ping localhost -n 1.9 >nul
echo.
set /p rst= Listening ^> 
if "%rst%"=="1" goto reset
if "%rst%"=="2" goto close
if not "%rst%"=="1"/"2"/stop goto main
:reset
cls
color 0c
type Resources\debug.txt
ping localhost -n 1.9 >nul
echo.
echo  Factory Resetting...
echo.
ping localhost -n 2 >nul
echo  Removing Settings...
ping localhost -n 1.9 >nul
attrib -h fullscreen.txt
del fullscreen.txt
echo.
ping localhost -n 2 >nul
echo  Clearing User Profile...
echo.
ping localhost -n 1.9 >nul
attrib -h password.txt
del password.txt
ping localhost -n 2 >nul
echo  Cleaning up...
echo.
ping localhost -n 1.9 >nul
del Apps.bat.bak
ping localhost -n 1.9 >nul
del TerminalOS.bat.bak
ping localhost -n 1.9 >nul
del settings\freset.bat.bak
ping localhost -n 1.9 >nul
del settings\rgb.bat.bak
ping localhost -n 1.9 >nul
del settings\settings.bat.bak
ping localhost -n 1.9 >nul
del settings\Debug.bat.bak
ping localhost -n 2 >nul
echo.
echo  Done!
ping localhost -n 2 >nul
echo.
echo  Restarting...
ping localhost -n 2 >nul
goto restart
:restart
call functions\restart.bat
:close
cls
exit /b
:ColorText
echo off
echo %DEL% > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof