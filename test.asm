.386
Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib


.data
	tableb	byte 10,20,30,40,50
	rowsize = ($ - tableb)
			byte 60,70,80,90,100
			byte 110,120,130,140,150

	; row byte 1
	; col byte 1
.code
main proc
	mov eax,1
	mov ebx,5
	mul ebx

	mov ebx, offset tableb
	add ebx,eax

	mov esi,	1
	mov eax,0
	mov al,[ebx + esi]
	call writeint

exit
main endp
end main