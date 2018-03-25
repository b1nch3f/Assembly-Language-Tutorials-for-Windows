; 32-BIT Template

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data

.code
main proc
	xor eax, eax
	xor ecx, ecx
	add ecx, 10

	here:
	inc	eax
	loop here

	invoke ExitProcess, 0 ;program terminates with return 0
main endp
end main