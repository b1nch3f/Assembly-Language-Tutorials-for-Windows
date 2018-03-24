; 64-BIT Template

ExitProcess PROTO

.data
num1	QWORD 41
num2	QWORD 50
res		QWORd 0

.code
main PROC
	mov rdx, 0        ; clear dividend
	mov rax, num1     ; dividend
	mov rcx, 2        ; divisor
	div rcx           ; RAX contains the result of division, RDX contains the remainder

	call ExitProcess
main ENDP
END