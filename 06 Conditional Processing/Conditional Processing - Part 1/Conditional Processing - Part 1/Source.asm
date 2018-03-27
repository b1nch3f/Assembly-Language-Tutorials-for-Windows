; 32-BIT Template

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data

.code
main PROC
	xor eax, eax
	mov ah, 00000000b
	sahf

	;PE(PARITY FLAG)
	or al, 1010b
	;ZE(ZERO FLAG)
	and al, 0000b
	;PL(SIGN FLAG)
	add al, 11111111b
	;CY(CARRY FLAG)
	xor eax, eax
	sub al, 1b
	;OV(OVERFLOW FLAG)
	xor eax, eax
	mov al, 01111111b
	add al, 01000000b

	INVOKE ExitProcess, 0 ;program terminates with return 0
main ENDP
END main