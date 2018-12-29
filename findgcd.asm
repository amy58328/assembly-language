.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib




.data

	Message1 BYTE 	"Enter a positive integer: ",0dh,0ah,0
	Message2 BYTE 	"Factors of ",0
	Message3 BYTE 	" are: ",0dh,0ah,0
	num 	DWORD 	?

.code
main proc
	call clrscr
	mov edx,	offset	Message1
	call writestring
 	call readint
 	mov edx,	0	
 	mov num,	eax
 	mov ecx,	num
 	mov ebx,	1
 	mov edx,	offset Message2
 	call writestring
 	call writedec
 	mov edx,	offset Message3
 	call writestring
 	mov edx,	0
 L1:
 	div ebx
 .if(edx==0)
 	mov eax,	ebx
 	call writedec
 	call crlf
 .endif
 	mov eax,	num
 	mov edx,	0
 	inc ebx
 	loop L1


 	exit

 main endp
end main