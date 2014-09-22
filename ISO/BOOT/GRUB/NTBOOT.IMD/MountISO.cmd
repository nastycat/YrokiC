title Mount ISO
color 1f
@echo off
cls
pushd "%~dp0"
echo MountISO.cmd running...
SET DRIVE_G4D=%CD:~0,2%
echo.
echo Install driver ImDisk...
set IMDISK_SILENT_SETUP=1
call .\imdiskdriver\install.cmd
echo.
echo Mount "%DRIVE_G4D%%MYISO%" using ImDisk...
call NameISO.cmd
imdisk.exe -a -o rem -f %DRIVE_G4D%%MYISO% -m #:
FOR %%i IN (C D E F G H I J K L N M O P Q R S T U V W X Y Z) DO IF EXIST %%i:\sources\install.wim SET CDDRIVE=%%i:
echo.
IF "%CDDRIVE%"=="" echo Error! "%DRIVE_G4D%%MYISO%" NO mount!
IF NOT "%CDDRIVE%"=="" echo OK. "%DRIVE_G4D%%MYISO%" mount on %CDDRIVE%. Found %CDDRIVE%\sources\install.wim.
call :delay
popd
exit

:delay
for /f "tokens=1,2,3,4 delims=:," %%A in ("%TIME%") do set /a HH=%%A, MM=1%%B-100, SS=1%%C-100, CC=1%%D-100, TBASE=((HH*60+MM)*60+SS)*100+CC
:: Delay  15 sec.
set /a TFIN=%TBASE%+1500
:ESPERAR
for /f "tokens=1,2,3,4 delims=:," %%A in ("%TIME%") do set /a HH=%%A, MM=1%%B-100, SS=1%%C-100, CC=1%%D-100, TACTUAL=((HH*60+MM)*60+SS)*100+CC
if %TACTUAL% lss %TBASE% set /a TACTUAL=%TBASE%+%TACTUAL%
if %TACTUAL% lss %TFIN% goto ESPERAR
goto :EOF
