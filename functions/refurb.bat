@echo off
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)
:main
echo Connecting to network...
netsh wlan set hostednetwork mode=allow ssid="Upnorth Computers 5g" key="133SSanta"
echo.
echo Connected!
echo.
echo Installing Adobe Reader...
echo.
echo y | winget install Adobe.Acrobat.Reader.64-bit
cls
echo.
echo Installed Adobe Reader...
echo.
echo Installing Java...
echo y | winget install -e --id Oracle.JavaRuntimeEnvironment
cls
echo.
echo Installed Java...
echo.
echo Installing LibreOffice...
echo y | winget install -e --id TheDocumentFoundation.LibreOffice
cls
echo.
echo Installed LibreOffice...
echo.
cls
echo Executing One-Liner...
dism /online /cleanup-image /restorehealth
sfc /scannow
cls
echo.
echo.
echo Default apps have been installed and the One-Liner has been partially ran.
echo You still have to configure LibreOffice, as well as run chkdsk, as this hasnt been added yet
echo ..as well as the rest of the setup, good luck!
echo.
set /p cmd=   Press any key to continue...:
goto close

:close
:: This is the close section, if you want to close your app just type "goto close"
cls
exit /b
:ColorText
echo off
echo %DEL% > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof