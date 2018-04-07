.model flat,stdcall

.code
addProc PROC, var1:DWORD, var2:DWORD
	mov eax, var1
	add eax, var2
	ret
addProc ENDP

Factorial PROC, var1:DWORD
	mov eax, var1
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
	ret
Factorial ENDP
END