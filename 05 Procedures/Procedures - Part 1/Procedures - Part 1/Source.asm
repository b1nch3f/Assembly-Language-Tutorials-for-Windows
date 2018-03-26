; 32-BIT Template

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
num1	DWORD 10
num2	DWORD 15
sum		DWORD 0

.code
main PROC
	call addNum
	xor eax, eax
	
	INVOKE ExitProcess, 0 ;program terminates with return 0
main ENDP

; adding num1, num2
addNum PROC
	mov	eax, num1
	add eax, num2
	mov sum, eax
	ret
addNum ENDP
END main