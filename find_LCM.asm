Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib


.data

	Message1 	BYTE 	"Enter two positive integer: ",0dh,0ah,0
	Message2 	BYTE 	"The LCM of ",0
	Message3 	BYTE 	" and ",0
	Message4 	BYTE 	" is: ",0
	n1			dword	?
	n2			dword	?
	minMultiple dword	?
	number 		dword  	?

.code
main proc
	call clrscr

L0:
	mov edx, OFFSET Message1
	call writestring
	
	call readint
	mov	n1, 	eax
.if(eax == 0)
	jmp L2
.endif
	call	readint
	mov n2,		eax
.if(eax == 0)
	jmp L2
.endif

	mov	ebx,	n1
.if(eax > ebx)
	mov minMultiple,	ebx
.else
	mov minMultiple,	eax
.endif
	
L1:
	mov eax,	minMultiple
	mov ebx,	n1
	mov edx,	0
	div	ebx
	
.if(edx == 0)
	mov eax,	minMultiple
	mov ebx,	n2
	mov	edx,	0
	div	ebx
	.if(edx == 0)
		mov edx,	OFFSET Message2
		call writestring

		mov eax,	n1
		call writedec

		mov edx,	OFFSET	Message3
		call writestring

		mov eax,	n2
		call writedec

		mov edx,	OFFSET	Message4
		call writestring

		mov	eax,	minMultiple
		call writedec
		call crlf
		call crlf
		jmp L0
	.else
		inc minMultiple
		jmp L1
	.endif
.else
	inc minMultiple
	jmp L1
.endif

L2:
	exit
	main endp
	end main