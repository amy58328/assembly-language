
Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
	MSG0 BYTE "Enter the Number to calculate the number of digits in the number: ", 0dh,0ah,0
	MSG1 BYTE "Total number of digits contained in the number that you entered are as follows: ", 0dh, 0ah, 0
	MSG2 BYTE "I am done executing the program, BYE! BYE!", 0dh, 0ah,0
	number DWORD 0
	count DWORD  0
.code
main PROC
	L0:
	mov edx, OFFSET MSG0    ; move the first message pointer into the edxregister.
	call writestring 		; write the string to the screen.
	call readint 			; Read the input from the screen
	mov number, eax 		; move the number read from the user to the number.
.if (eax<=0)   				; If the eaxis less than or equal to zero.
	jmp L3         			; the user has entered 0 or minus value, we quit.
.ENDIF         				; End the if statement.
	mov ecx, eax   			; move the eaxto ecxto loop that many time.
	mov ebx, 10    			; move 10 to ebx, so we can do the divide.
	mov eax, number    		; Now we move the number to eaxregister.
	L1:            			; we are going to loop so we have L1 label variable.
.if(eax>0)     				; as long as eaxgreater than 10, then we try to divide by 10
	cdq 					; get ready to divide 
	mov ebx, 10    			; move 10 to register ebxto get ready to 10
	idiv ebx 		  		; do the divide using eaxand ebx.
	inc count               ; increment the count.
	Loop L1                 ; call the loop L1 to loop around.
.else                   	; If we need not loop, go to L2.
	jmp L2                  ; jump to L2
.ENDIF                  	; Now end the If statement.
	L2:
	mov edx, OFFSET MSG1    ; Move the message to print the result
	call writestring 		; print the string to show on screen.
	mov eax, count         	; move the count to eaxto print.
	call writedec			; write the result
	call crlf				; enter one more line space.
	mov count, 0            ; now more zero to start the next ex.                 
	call crlf				; enter one more line space.
	jmp L0                  ; Now go back to L0 to start again.
	L3:
	mov edx, OFFSET MSG2    ; move a message to quit the prog.
	call writestring		; print the string.
	call crlf				; change the line to move next
	exit 
	main ENDP               ; end the main procedure here.
	END main 