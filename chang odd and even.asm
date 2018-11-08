.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
	farray dword 21, 32, 45, 64, 76, 87, 56, 23, 34, 77
	count EQU (lengthof farray)
	sarray dword count dup(0)

.code
main proc
	call clrscr
	mov esi,0
	mov ecx,count
L1:
	mov eax, farray[esi]					; move the first element in to eax
	mov sarray[esi + 4], eax				; move the element to the second place in result array
	mov eax, farray[esi + 4]
	mov sarray[esi], eax					; move the eax into the first place into the result array
	add esi, 8				; increment two element into the esi to proceed ahead.
	loop L1	

	mov esi ,0
	mov ecx,count		

; call dumpregs

L2:
	mov eax , farray[esi]
	call writeint 
	call crlf
	add esi, 4
	LOOP L2

	call crlf
	mov ecx,count
	mov esi,0
L3:
	mov eax,sarray[esi]
	call writeint
	call crlf
	add esi,4
	LOOP L3

	exit 
	main endp
	end main