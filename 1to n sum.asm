.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
	sum dword 0
.code
main proc
L0:
	call readint
L3:
.if(eax<=0)
	jmp L2
.endif

	mov sum,0
	mov ecx,eax
	mov ebx,1
	mov eax,0


L1:
	add eax,ebx
	add sum,eax
	call writedec
	call crlf
	loop L1

	mov eax,sum
	call writedec
	call crlf
	jmp L0
	L2:
	exit 
	main endp
	end main