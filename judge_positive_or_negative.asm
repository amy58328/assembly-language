.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib




.data

	Message1	BYTE 	"Enter a integer: ",0dh,0ah,0
	Message2	BYTE 	"You entered a negative number.",0dh,0ah,0
	Message3	BYTE 	"You entered a positive number.",0dh,0ah,0
	Message4	BYTE 	"You entered 0.",0dh,0ah,0
	num			SDWORD 	?
	count    	DWORD	1
	

.code
main proc
	call clrscr
l0:
	mov edx,	offset	Message1
	call writestring

	call readint
	mov num,	eax
	call writeint
	call crlf


.if(num > 0)
	mov edx,	offset	Message3
	call writestring
	jmp L0
.endif

.if(num == 0)
	mov edx,	offset	Message4
	call writestring
	jmp L0


.else 
	mov edx,	offset Message2
	call writestring
	jmp L0

.endif

; .else 
; 	mov edx,	offset 	Message4
; 	call writestring
; 	jmp L0
; .endif

	exit

 main endp
end main