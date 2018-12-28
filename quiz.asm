.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

	lon dword ?
	string1 byte 80 dup(?)
	ans dword 0

	find proto,
	use: ptr byte
	
.code
main proc
	
	mov ecx,	lengthof string1
	mov edx,	offset	string1
	call readstring
	mov lon,	eax

	invoke find,addr string1

	call printout

	exit
main endp 

printout proc

	mov edx,	offset string1
	call writestring
	call crlf
	
	mov eax, ans
	call writedec
	call crlf

	ret 
printout endp

find proc,
	use : ptr byte

	mov ecx,	lon
	mov eax,	0

	mov bl, '\'
	mov esi,	use

L1:
	cmp [esi],	bl
	je	same
	jmp other 

	same:
		inc ans
		mov al," "
		mov [esi], al
	other:
		inc esi

	loop L1
	ret
find endp
	
end main
