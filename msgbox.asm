.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
	caption db "dialog title",0
	hellowmsg 	byte 	"Are you a human ? ",0dh,0ah,0
				;byte	"click ok to contunue ... ",0
	anseryes	byte	"oh ",0dh,0ah
				byte	"so what ?",0
	anserno		byte	"then , what are you ?",0dh,0ah
				byte	"A pig ? ",0

.code
main proc
	mov	ebx,	offset 	caption
	mov edx,	offset	hellowmsg
	call msgboxask		;will return to eax ; if is yes return 6 ; if is no return 7
.if(eax == 6)
	mov ebx,	0
	mov edx,	offset	anseryes
	call msgbox

.else
	mov ebx,	0
	mov edx,	offset	anserno
	call msgbox

.endif
	main endp
	end main
