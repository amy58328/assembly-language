.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
	array 	byte 	200 dup(0)
	rearray	byte 	200 dup(0)
	n1 		dword 	?
	n2 		dword	?
	count 	dword 	0
	sum 	dword 	0
	msg1	byte	"enter n1: ",0dh,0ah,0
	msg2	byte	"enter n2: ",0dh,0ah,0
	msg3	byte	"the fallow are :",0dh,0ah,0
	msg4	byte	"the same is :",0dh,0ah,0


.code
main proc
	call		clrscr
	mov	edx,	offset	msg1
	call		writestring
	call		readint
	mov	n1,		eax
	mov	edx,	offset	msg2
	call 		writestring
	call 		readint
	mov n2,		eax

	mov	eax,	n2
	sub eax,	n1
	mov ecx,	eax
	inc ecx
	mov eax,	n1

	mov esi,	0
l1:
	mov array[esi],		al
	add esi,	type	array
	inc eax
	inc count
	loop l1

	mov ecx,	count
	mov esi,	0
	mov edi,	count 
	sub edi,	type	array

l2:
	mov al,				array[edi]
	mov rearray[esi],	al
	add esi,			type	rearray
	sub edi,			type	array
	loop l2

	mov ecx,	count
	mov	esi,	0
	mov edx,	offset	msg3
	call writestring


l3:
	mov al,		rearray[esi]
	add esi,	type	rearray
	add sum,	eax
	call 		writedec
	call 		crlf
	loop l3

	mov edx,	offset	msg4
	call writestring

	mov eax,sum
	call writedec
	call crlf

	
	main endp
	end main
