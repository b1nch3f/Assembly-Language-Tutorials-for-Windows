; 32-BIT Template

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

clearAccumulators MACRO
	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx
ENDM

COORD STRUCT
	X DWORD ?
	Y DWORD ?
COORD ENDS

.data
location1 COORD <1, 2>

.code
main PROC
	clearAccumulators

	mov eax, location1.X
	mov ebx, location1.Y

	INVOKE ExitProcess, 0 ;program terminates with return 0
main ENDP
END main