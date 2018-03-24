; 32-BIT Template

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
num1	DWORD 41
num2	DWORD 50
res		DWORd 0

.code
main PROC
	mov edx, 0        ; clear dividend
	mov eax, num2	  ; dividend
	mov ecx, 2        ; divisor
	div ecx           ; EAX contains the result of division, EDX contains the remainder

	INVOKE ExitProcess, 0 ;program terminates with return 0
main ENDP
END main