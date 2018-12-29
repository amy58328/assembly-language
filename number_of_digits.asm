.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib




.data

	Message1	BYTE 	"Enter a integer: ",0dh,0ah,0
	Message2	BYTE 	"number of digits:",0dh,0ah,0
	num			DWORD 	?
	count    	DWORD	1
	

.code
main proc
	call clrscr
l0:
	mov edx,	offset	Message1
	call writestring
 	call readint
 .if(eax==0)
 	jmp l2
 .endif

 	mov ebx,	10
 	mov edx,	0



 L1:
 	div ebx

 .if(eax>0)
 	inc count
 	mov edx,	0
 	mov ebx,	10
 	jmp l1
 .else
 	mov edx,	offset Message2
 	call writestring
 	mov eax,	count
 	call writedec
 	call crlf
 	mov count,	1
 	jmp l0
 .endif

 L2:

 	exit

 main endp
end main