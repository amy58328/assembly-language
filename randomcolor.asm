.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib



.data
	color	dword	?


.code
main proc
	mov ecx,	10
	call randomize

l1:
	mov eax,	16
	call randomrange
	mov color,	eax
	mov eax,	color + (0*16)
	call settextcolor
	mov eax,	100
	call randomrange
	call writeint
	call crlf
	loop l1 

	exit

	main endp
	end main
