; 32-BIT Template

.386
.model flat,stdcall
.stack 4096

EXTERN ExitProcess@4:PROC

.data
myarray		BYTE 1, 2, 3, 4, 5
myarray2	BYTE 5 DUP(?)

differentArray BYTE 1, 2, 3, 4, 6
multiplier BYTE 2

.code
main PROC
	;MOVSB
	cld
	mov ecx, LENGTHOF myarray
	mov esi, OFFSET myarray
	mov edi, OFFSET myarray2
	rep movsb

	;CMPSB
	cld
	mov ecx, LENGTHOF myarray
	mov esi, OFFSET myarray
	mov edi, OFFSET differentArray
	repe cmpsb
	jz Match
	jnz NoMatch
	
	Match:
	mov eax, 'Y'
	jmp Exit

	NoMatch:
	mov eax, 'N'

	;SCASB
	cld
	mov ecx, LENGTHOF myarray
	mov edi, OFFSET myarray
	mov al, 4
	repne scasb
	jnz Exit
	sub edi, OFFSET myarray ;found item-position

	;STOSB
	cld
	mov ecx, LENGTHOF differentArray
	mov edi, OFFSET differentArray
	mov al, 2
	rep stosb

	;LOADSB
	cld
	mov ecx, LENGTHOF differentArray
	mov esi, OFFSET differentArray
	mov edi, esi
	L1:
	lodsb
	mul multiplier
	stosb
	loop L1

	Exit:
	push 0
	call ExitProcess@4 
main ENDP
END main