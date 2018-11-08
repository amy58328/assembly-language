.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
	array	byte	1,2,3,4,5,6,7,8,9,10
	asize	equ(lengthof array)



.code
main proc

	mov eax,	0
	mov ecx,	asize
	mov esi,	0

L1:
	mov al,	array[esi]
	add	esi,	type	array
	push	eax
	loop L1

	mov ecx,	asize
	mov esi,	0

L2:
	pop eax
	mov array[esi],		al
	add	esi,	type	array
	loop L2

	mov ecx,	asize
	mov esi,	0

L3:
	mov	al,		array[esi]
	call writeint 
	call crlf
	add esi,	type	array
	Loop L3

	
	exit
	main endp
	end main
