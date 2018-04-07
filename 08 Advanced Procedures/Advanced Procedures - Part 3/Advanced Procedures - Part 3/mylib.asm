.model flat,stdcall

.code
addProc PROC, var1:DWORD, var2:DWORD
	mov eax, var1
	add eax, var2
	ret
addProc ENDP

addProc2 PROC
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8]
	add eax, [ebp + 12]
	mov esp, ebp
	pop ebp
	ret
addProc2 ENDP
END