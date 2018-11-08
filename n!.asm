.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
	string1 byte "enter n1",0dh,0ah,0
	string2 byte "enter n2",0dh,0ah,0
	n1 dword ?
	n2 dword ?


.code
main proc
L0:
	mov edx,	offset string1
	call		writestring
	call		readint
	mov n1,		eax

	mov edx, 	offset string2
	call 		writestring
	call 		readint
	mov n2,	 	eax

.if(n2 == 0)
	jmp l3
.endif

	mov eax,	n2
	sub eax,	n1
	mov ecx,	eax

.if(ecx <=2)
	mov eax, 	1
	jmp l2
.endif

	mov eax, 	1
	mov ebx,	1

L1:
	imul eax,	ebx
	inc ebx
	loop L1

L2:
	call writedec
	call crlf
	call crlf
	
	jmp L0

l3:
	exit 
	main endp
	end main