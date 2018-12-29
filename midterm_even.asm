.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
 
	 msg1	byte	"enter number :", 0
	 msg2	byte	"the random are followig : ",0dh,0ah, 0
	 msg3	byte	"the biggest is  ",0dh,0ah,0
	 time 	dword	? 
	 big 	dword	0

.code
main PROC
	mov edx,	offset	msg1
	call writestring
	call readint
	mov time ,	eax
	mov ecx,	time
	call randomize
	mov edx,	offset	msg2
	call writestring

L1:
	mov eax,	100
	call randomrange
	add	eax,	100
.if(big < eax)
	mov big,	eax
.endif
	call writeint
	call crlf
	loop L1

	mov edx,	offset	msg3
	call writestring
	mov eax,	big
	call writeint
	call crlf

	main endp
 	END main