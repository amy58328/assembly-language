include Irvine32.inc

.data

arrayWORD			WORD	200	DUP(0)
count				EQU		(LENGTHOF arrayWORD)
reversearrayWORD	WORD	count DUP(0)
N1					DWORD	0
N2					DWORD	0
runvalue			DWORD	0
Total				DWORD	0
MSG0				BYTE	"Enter N1 : ", 0dh, 0ah, 0
MSG1				BYTE	"Enter N2 : ", 0dh, 0ah, 0
MSG2				BYTE	"Count Value ¡õ", 0dh, 0ah, 0
MSG3				BYTE	"Total ¡õ", 0dh, 0ah, 0

.code

main proc
	xor		edx,		edx
	mov		edx,		offset MSG0
	call	writeString

	xor		eax,		eax
	call	readInt
	mov		N1,			eax
	call	crlf
	
	xor		edx,		edx
	mov		edx,		offset MSG1
	call	writeString
	
	xor		eax,		eax
	call	readInt
	mov		N2,			eax
	call	crlf

	xor		eax,		eax
	mov		eax,		N2
	sub		eax,		N1
	inc		eax
	mov		runvalue,	eax

	xor		ecx,		ecx
	xor		ebx,		ebx
	xor		esi,		esi
	mov		ecx,		runvalue
	mov		ebx,		N1
	mov		esi,		offset arrayWORD
L1 :
	mov		[esi],		bx
	inc		ebx
	add		esi,		TYPE arrayWORD
Loop L1

	call	crlf
	xor		edx,		edx
	mov		edx,		offset MSG2
	call	writeString

	xor		ecx,		ecx
	xor		edi,		edi
	mov		ecx,		runvalue
	mov		edi,		offset reversearrayWORD
	sub		esi,		TYPE arrayWORD
L2 :
	xor		eax,		eax
	mov		ax,			[esi]
	call	writeInt
	mov		[edi],		ax
	call	crlf
	add		eax,		Total
	mov		Total,		eax
	sub		esi,		TYPE arrayWORD
	add		edi,		TYPE reversearrayWORD
Loop L2
	
	call	crlf
	xor		edx,		edx
	mov		edx,		offset MSG3
	call	writeString
	
	mov		eax,		Total
	call	writeInt
	call	crlf
	
	exit
main endp
end main