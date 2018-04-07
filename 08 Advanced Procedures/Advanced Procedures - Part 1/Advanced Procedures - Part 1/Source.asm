; 32-BIT Template

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
myArray BYTE 1, 2, 3, 4

.code
main PROC
	push 6
	push 5
	call addNums
	add esp, 8 ;C calling convention, the caller clears the stack, used by c/c++ 

	call localProc
	
	push offset myArray
	push 4
	call processArray

	call leaDemo

	INVOKE ExitProcess, 0 ;program terminates with return 0
main ENDP

addNums PROC
	push ebp
	mov ebp, esp
	mov eax, [ebp + 12]
	add eax, [ebp + 8]
	pop ebp
	ret 8	;stdcall calling convention, the calee clears the stack, used by WinAPI
addNums ENDP

localProc PROC
	push ebp
	mov ebp, esp
	sub esp, 8
	mov dword ptr [ebp - 4], 5
	mov dword ptr [ebp - 8], 6
	mov esp, ebp
	pop ebp
	ret
localProc ENDP

processArray PROC
	push ebp
	mov ebp, esp
	pushad ;save registers
	mov esi, [ebp + 12] ;array offset
	mov ecx, [ebp + 8]	;array length
	L1:
	mov eax, [esi]
	add esi, TYPE BYTE
	loop L1
	popad
	pop ebp
	ret 8 ;add esp, 8
processArray ENDP

leaDemo PROC
	push ebp
	mov ebp, esp
	sub esp, 12 ;local array
	lea esi, [ebp-10] ;OFFSET works at assemble time
	mov ecx, 10
	L1:
	mov BYTE PTR [esi], 'A'
	add esi, TYPE BYTE
	loop L1
	add esp, 12 ;restore stack
	pop ebp
	ret
leaDemo ENDP
END main