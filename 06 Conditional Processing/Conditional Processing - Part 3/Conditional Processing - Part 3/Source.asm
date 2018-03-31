; 32-BIT Template

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
nums	BYTE 1, 3, 7, 9, 8, 11, 13, 3
res		BYTE ?

.code
main PROC
	xor esi, esi
	mov ecx, LENGTHOF nums
	xor eax, eax
L1:	
	mov al, nums[esi]
	add esi, type nums
	test al, 01h
	loopnz L1

	mov res, al

	INVOKE ExitProcess, 0 ;program terminates with return 0
main ENDP
END main