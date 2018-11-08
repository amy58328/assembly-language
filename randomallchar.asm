.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
	

.code
main proc
	mov ecx,20

L1:
	mov	eax,	3
	call randomrange
.if(eax == 0)
	mov eax,	26
	call randomrange
	add eax,	'A'
	call writechar

.endif

.if(eax == 1)
	mov eax,	26
	call randomrange
	add eax,	'a'
	call writechar


.endif

.if(eax == 2)
	mov eax,	9
	call randomrange
	call writedec


.endif
	loop l1


	exit
	main endp
	end main
