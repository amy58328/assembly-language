.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data


.code
main proc
l0:
	mov eax,	5000
	call 		randomrange
	call 		writeint
	call 		crlf
	call 		msgboxask
.if(eax == 6)
	jmp l0
.else 
	jmp l1
.endif
l1:
	
	main endp
	end main
