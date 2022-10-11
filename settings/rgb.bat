@echo off
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)
:color
ping localhost -n 1.9 >nul
cls
color 3e
echo.
echo ------------------------------------------------
echo.
ping localhost -n 1.9 >nul
echo  Which color would you like?
echo.
echo  Installed colors:
echo.
echo  1 - Pink
echo  2 - Aqua
echo.
echo  m - Return to Main Menu
echo.
ping localhost -n 1.9 >nul
set /p color= Listening ^> 
if "%color%"=="1" goto colorPurple
if "%color%"=="2" goto colorAqua
if "%color%"=="m" goto close
if not "%color%"=="1"/"2"/"m"/stop goto color
:colorPurple
ping localhost -n 1.9 >nul
cls
color 3e
echo.
echo ------------------------------------------------
echo.
echo  Setting color to pink, please wait...
ping localhost -n 3 >nul
cd settings\RGB
echo.
OpenRGB.exe -c ff00ff
echo.
echo  Success!
ping localhost -n 2 >nul
goto color
:colorAqua
ping localhost -n 1.9 >nul
cls
color 3e
echo.
echo ------------------------------------------------
echo.
echo  Setting color to Aqua, please wait...
ping localhost -n 3 >nul
cd settings\RGB
echo.
OpenRGB.exe -c 05f7ff
echo.
echo  Success!
ping localhost -n 2 >nul
goto color
:close
cd %cd%
cls
exit /b
:ColorText
echo off
echo %DEL% > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof