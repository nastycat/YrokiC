!BAT
debug 1
set cmdfile=(hd0,0)/ABC.cmd
set gpath=/ddd/iso/гарна дівка/. машина/моя фігня.TXT
echo -n > %cmdfile%
echo -e set myfile=%gpath%\r\n\exit\r\n > %cmdfile%
cat --locate="/" --replace="\\" %cmdfile%
pause 
exit


map (md)0x2000 (rd)
read 0x82d0
call Fn.24 %@retval% 0x00 4096
dd if=(rd)+1 of=(hd3,0)/ABC.cmd
dd if=(hd0,0)/ABC.cmd of=(hd0,0)/ABCD.cmd

set gpath=/B/GRUB1231.TXT
echo %gpath%
echo -n > (md)0x1000+1
echo -e %gpath% > (md)0x1000+1
echo \n > (md)0x1000+1
cat --locate="/" --replace="\\" (md)0x1000+1
cat (md)0x1000+1 | set wpath=
echo %wpath%
write (hd0,0)/ABC.cmd %wpath%
dd if=(hd0,0)/ABC.cmd of=(hd0,0)/ABCDE.cmd
pause 
exit

pause 
exit


title Mini Windows Xp
#find --set-root /iso/mm.WIM
#map --mem /XP/f6drivers.img (fd0)&&map --hook
#command %NTBOOT% PE1=/iso/mm.WIM PDIR=I386
command %NTBOOT%.CMD/RUNS PE=/iso/mm.WIM


title Mini Windows Xp
#find --set-root /iso/mm.WIM
#map --mem /XP/f6drivers.img (fd0)&&map --hook
command %NTBOOT% PE1=/iso/mm.WIM PDIR=I386

title Mini Windows Xp
#find --set-root /iso/mm.WIM
#map --mem /XP/f6drivers.img (fd0)&&map --hook
command %NTBOOT% PE1=/iso PDIR=I386

title wim NT5
call set showpath=0
call set slient=1
command %NTBOOT%.CMD/RUNS --noload --autolist-all show.wim subdir=%_subdir% "%_iso%" --end exit
command %NTBOOT% PE1=%loadroot%%loadfile% PDIR=I386

title iso NT5
call set showpath=0
call set slient=1
command %NTBOOT%.CMD/RUNS --noload --autolist-all show.iso subdir=%_subdir% "%_iso%" --end exit
command %NTBOOT%.CMD/RUNS --fira-isonly iso=%loadroot%%loadfile%




 
set gpath=/BOOT/GRUB123/NTBOOT.IMD/123 456.TXT 
echo %gpath% 
echo -n > (md)0x1000+1 
echo -e %gpath% > (md)0x1000+1 
cat --locate="/" --replace="\\" (md)0x1000+1 
cat (md)0x1000+1 | set wpath= 
echo %wpath%  
pause 
exit












set gpath=/BOOT/GRUB123/NTBOOT.IMD/123 456/12.TXT/1
echo %gpath%

call Fn.11 "%gpath%" "/"
set count=%@retval%
set wpath=\
set gpath=%gpath:~1%
:begpath
call Fn.11 "%gpath%" "/" || goto :endpath
set /a base=%@retval%-%count% > nul
call set cpath=%^gpath:~0,%base%%% > nul
set wpath=%wpath%%%cpath%\
set /a base=%base%+1 > nul
call set gpath=%^gpath:~%base%%%
goto :begpath
:endpath
set wpath=%wpath%%%gpath%

echo %wpath%
pause
goto :eof



call Fn.11 "%p2%" "/"
set /a base=%@retval%-%count%
echo %base%
set /a min2=%base%+1
echo %min2%
call set p3=%^p2:~%min2%%%
echo p3=%p3%
call Fn.11 "%p3%" "/"
set /a base=%@retval%-%count%
echo %base%
set /a min2=%base%+1
echo %min2%
call set p4=%^p3:~%min2%%%
echo p4=%p4%
call Fn.11 "%p4%" "/"
set /a base=%@retval%-%count%
echo %base%
set /a min2=%base%+1
echo %min2%
call set p5=%^p4:~%min2%%%
echo p5=%p5%

::echo 123,456,789 > (md)0x200+1
::call Fn.13 0x40000 ","
::echo First string at %@retval%
::call Fn.13 0 ","
::echo Next string at %@retval%
::call Fn.13 0x40000 ","
::echo First string at %@retval%
::call Fn.13 0 ","
::echo Next string at %@retval%
::call Fn.13 0 ","
::echo Next string at %@retval%
::cat --skip=262152 (md)0+0x201
echo %gpath%
pause
goto :eof