@echo off
rem 2017, created by avrin.

set device=16F1827

set compiler_root=d:/0pic-data/jalv2-data/jallib_full-1.6.0


rem --- make device include file
@echo on
echo include %device% > device_select.jal
@echo off

set main_source=main.jal
set compiler_option=-temp-reduce

rem ------ compile command --------
%compiler_root%/Compiler/jalv2.exe -s %compiler_root%/lib -s lib %compiler_option% -hex sd-wav-player-%device%.hex %main_source%

