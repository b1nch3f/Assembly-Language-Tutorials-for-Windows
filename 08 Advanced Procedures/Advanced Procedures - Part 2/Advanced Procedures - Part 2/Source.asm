; 32-BIT Template

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
num1 DWORD 5

.code
main PROC
	push num1
	call Factorial

	INVOKE ExitProcess, 0 ;program terminates with return 0
main ENDP

Factorial PROC
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8]
	cmp eax, 0
	ja L1
	mov eax, 1
	jmp L2
	L1:
	dec eax
	push eax
	call Factorial
	ReturnFact:
	mov ebx, [ebp + 8]
	mul ebx
	L2:
	pop ebp
	ret 4
Factorial ENDP
END main