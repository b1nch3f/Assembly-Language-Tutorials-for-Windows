; Template
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
sum DWORD 0

.code
main PROC
	mov eax, 5
	add eax, 10
	mov sum, eax

	INVOKE ExitProcess, 0 ;program terminates with return 0
main ENDP
END main