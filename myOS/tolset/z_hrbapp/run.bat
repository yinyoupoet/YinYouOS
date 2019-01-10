@echo off
if %1.==. goto def_opt
if %1.==.. goto no_opt
..\z_tools\edimg.exe imgin:../z_tools/hrb_qemu/haribote.img copy from:%1.hrb to:@: imgout:../z_tools/qemu/fdimage0.bin
if errorlevel 1 goto end
goto qemu
:def_opt
..\z_tools\edimg.exe @!run_opt.txt
if errorlevel 1 goto end
goto qemu
:no_opt
copy ..\z_tools\osa_qemu\osaimgqe.bin ..\z_tools\qemu\fdimage0.bin
:qemu
..\z_tools\make.exe -r -C ../z_tools/qemu
:end
