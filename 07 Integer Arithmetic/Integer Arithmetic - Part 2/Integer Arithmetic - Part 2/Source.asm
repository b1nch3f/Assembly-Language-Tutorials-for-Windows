; 32-BIT Template

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
sum DWORD 0

.code
main PROC
	xor eax, eax
	xor ebx, ebx

	mov ax, 4
	mov	bx, -4
	imul bx

	xor eax, eax
	xor edx, edx
	xor ebx, ebx
	
	mov ax, 8
	mov dx, 0
	mov bx, 2
	div bx

	xor eax, eax
	xor edx, edx
	xor ebx, ebx
	
	mov al, -48
	cbw
	mov bl, 5
	idiv bl

	INVOKE ExitProcess, 0 ;program terminates with return 0
main ENDP
END main