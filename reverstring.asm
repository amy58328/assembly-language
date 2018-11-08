.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
	string	byte	"who are you ? ",0
	stringsize = ($ - string ) - 1



.code
main proc
	call	CLRSCR
	; mov edx,	offset string
	; call writestring
	; call crlf

	mov ecx,	stringsize
	mov esi,	0

L1:
	movzx	eax,	string[esi]
	push 	eax
	add		esi,	type string
	loop L1

	mov ecx,	stringsize
	mov esi,	0

L2:
	pop	eax
	mov string[esi],	al
	add	esi,	type	string
	loop L2

	mov edx,	offset string
	call writestring
	call crlf

	
	exit
	main endp
	end main
