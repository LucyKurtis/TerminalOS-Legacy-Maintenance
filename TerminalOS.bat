@echo off
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)
cls
if not exist null.txt echo.> null.txt
if not exist password.txt echo.> password.txt
if not exist fullscreen.txt echo.> fullscreen.txt
attrib +h fullscreen.txt
title TerminalOS
color 0e
type Resources\logo.txt
echo.
echo    ^[                                         ^]
ping localhost -n 2 >nul
cls
type Resources\logo.txt
echo.
echo    ^[-----------                              ^]
ping localhost -n 2 >nul
cls
type Resources\logo.txt
echo.
echo    ^[----------------------------             ^]
ping localhost -n 2.5 >nul
cls
type Resources\logo.txt
echo.
title TerminalOS
echo    ^[---------------------------------------  ^]
ping localhost -n 2 >nul
cls
type Resources\logo.txt
echo.
FOR /F "tokens=* delims=" %%x in (fullscreen.txt) do set "fullscreen=%%x"
if not "%fullscreen%"=="2" (
	wscript "fullscreen.vbs"
)
echo    ^[-----------------------------------------^]
ping localhost -n 2 >nul
cls
color 0a
type Resources\logo.txt
echo.
echo    ^[-----------------------------------------^]
echo. 
echo  Starting up...
ping localhost -n 3 >nul
cls
:blankpass
set /p passin=<password.txt
set /p nullin=<null.txt
if "%passin%" == "%nullin%" (
	goto resetpass
)
if not "%passin%" == "%nullin%" (
	goto pass
)
:resetpass
cls
color 0e
type Resources\logo.txt
echo.
attrib -h password.txt
attrib -h null.txt
ping localhost -n 1.9 >nul
echo.> password.txt
echo.> null.txt
set /p cpass= Please enter your new password ^> 
echo | set /p =%cpass%>> tpassword.txt <NUL
findstr /v "^$" tpassword.txt > password.txt
del tpassword.txt
attrib +h password.txt
attrib +h null.txt
cls
color 0a
type Resources\logo.txt
echo.
echo Please enter your new password ^> 
echo.
echo  -- New Password Saved --
ping localhost -n 3 >nul
goto pass
:pass
cls
color 0e
FOR /F "tokens=* delims=" %%x in (password.txt) do set "pass=%%x"
type Resources\logo.txt
echo.
ping localhost -n 1.9 >nul
set /P "=_" < NUL > " Enter password"
findstr /A:0f /V "^$" " Enter password" NUL > CON
del " Enter password"
set /P "upass1=" 
set space = " "
set upass2=%upass1% %space%
if "%upass2%" == "%pass%" (
	cls
	color 0a
	type Resources\logo.txt
	echo.
	echo  Enter password:
	echo.
	echo  -- Access Granted --
	ping localhost -n 3 >nul
	goto MainMenu
)
if not "%upass2%" == "%pass%" (
	cls
	color 0c
	type Resources\logo.txt
	echo.
	echo  Enter password:
	echo.
	echo  -- Access Denied --
	ping localhost -n 3 >nul
	goto pass
)
:MainMenu
ping localhost -n 1.9 >nul
cls
color 3e
type Resources\menu.txt
echo.
echo.
ping localhost -n 1.9 >nul
echo  What would you like to do?
echo.
ping localhost -n 1.9 >nul
echo  1 - Settings Menu
echo.
ping localhost -n 1.9 >nul
echo  f - Toggle Fullscreen
ping localhost -n 1.9 >nul
echo  a - App Menu
echo.
ping localhost -n 1.9 >nul
call :ColorText 34 " s - Shut down TerminalOS"
ping localhost -n 1.9 >nul
call :ColorText 34 " r - Restart TerminalOS"
ping localhost -n 1.9 >nul
call :ColorText 34 " d - Enter Debug Menu"
echo.
ping localhost -n 1.9 >nul
set /p cmd= Listening ^> 
if "%cmd%"=="1" goto settings
if "%cmd%"=="s" goto shutdown
if "%cmd%"=="r" goto restart
if "%cmd%"=="f" goto fullscreen
if "%cmd%"=="a" goto appmenu
if "%cmd%"=="d" goto debug
if not "%cmd%"=="1"/"s"/"r"/"f"/"a"/"d"/stop goto MainMenu
:fullscreen
cls
wscript "fullscreen.vbs"
goto MainMenu
:debug
cls
call settings\Debug.bat
goto MainMenu
:settings
cls
call settings\settings.bat
goto MainMenu
:appmenu
call Apps.bat
goto MainMenu
:shutdown
call functions\shutdown.bat
:restart
call functions\restart.bat
:ColorText
echo off
echo %DEL% > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof