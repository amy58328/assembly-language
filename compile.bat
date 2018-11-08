@echo off

cls
echo compiling
ml /c /Zd /coff %1.asm


if %ERRORLEVEL% EQU 0 (
	echo finish
	Link /SUBSYSTEM:CONSOLE %1.obj
	%1.exe
)