; 32-BIT Template

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

factor	EQU 2
myDiv	TEXTEQU <mov ecx, factor>

.data
num1	DWORD 40
num2	DWORD 51

.code
main PROC
	mov edx, 0        
	mov eax, num1  
	myDiv
	div ecx           ; EAX contains the result of division, EDX contains the remainder

	INVOKE ExitProcess, 0 ;program terminates with return 0
main ENDP
END main