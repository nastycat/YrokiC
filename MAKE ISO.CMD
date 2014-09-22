@echo off
::hide files
::set hidefile= GRLDR BOOT\IMGS MINIPE\WINPE03.IS_ MINIPE\WINPE.IM_ W7PE WXPE
::echo.boot.catalog>hide.txt
::for %%i in (%hidefile%) do dir iso\%%i*/b>>hide.txt
pushd "%~dp0"
path %path%;"%~dp0MAKEISOFILES"
set diriso=ISO
set nameboot=GRLDR
set nameiso=ALLRUN.ISO
set namediriso=ALLRUN
echo dir iso=%diriso%
echo boot=%nameboot%
echo name iso=%nameiso%
echo.
mkisofs.exe -R -J -joliet-long -hide-joliet boot.catalog -l -b %nameboot% -o %nameiso% -V "%namediriso%" -relaxed-filenames -allow-lowercase -allow-multidot -gbk4dos-filenames -gbk4win-filenames -no-emul-boot -boot-load-size 4  %diriso%
if %errorlevel% equ 0 goto :end
echo.
echo.
set nameboot=grldr
echo dir iso=%diriso%
echo boot=%nameboot%
echo name iso=%nameiso%
echo.
mkisofs.exe -R -J -joliet-long -hide-joliet boot.catalog -l -b %nameboot% -o %nameiso% -V "%namediriso%" -relaxed-filenames -allow-lowercase -allow-multidot -gbk4dos-filenames -gbk4win-filenames -no-emul-boot -boot-load-size 4  %diriso%
:end
popd
echo.
echo.
pause