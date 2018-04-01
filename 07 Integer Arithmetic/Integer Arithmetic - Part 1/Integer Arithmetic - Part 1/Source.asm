; 32-BIT Template

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data

.code
main PROC
	xor eax, eax
	mov al, 0ah

	;SHR
	shr al, 1

	xor eax, eax
	mov al, 01h
	
	;ROR
	ror al, 1

	INVOKE ExitProcess, 0 ;program terminates with return 0
main ENDP
END main