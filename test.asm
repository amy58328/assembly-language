.386
Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib


.data
	message1 byte "Enter an integer: ",0dh,0ah,0
	message2 byte "Enter another integer: ",0dh,0ah,0
	message3 byte "The bigger number is: ",0
	message4 byte "The small number is: ",0
	t dword ?
	max dword 0
	min dword 1000
	one dword 1

.code
main proc
	call clrscr

	mov edx , offset message1
	call writestring

	call readint
	mov t, eax

L1:
	mov eax , t
.if(eax <=0)
	jmp L2
.endif
	sub eax, one
	mov t , eax

	mov edx, offset message2
	call writestring

	call readint

	mov ebx , max
.if(ebx < eax  )
	mov max , eax
.endif
	
	mov ebx , min
.if(eax < ebx)
	mov min, eax
.endif
	jmp L1
	
L2:
	mov edx, offset message3
	call writestring

	mov eax , max
	call writedec

	call crlf

	mov edx, offset message4
	call writestring

	mov eax , min
	call writedec

exit
main endp
end main