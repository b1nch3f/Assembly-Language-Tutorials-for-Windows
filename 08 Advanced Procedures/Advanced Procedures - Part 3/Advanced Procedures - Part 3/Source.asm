; 32-BIT Template

.386
.model flat,stdcall
.stack 4096

INCLUDE mylib.inc

.data
num1 DWORD 5

.code
main PROC
	push num1
	push num1
	call addProc@8 ;stdcall
	
	nop
	
	push num1
	push num1
	call addProc2@0 ;cdecl 
	add esp, 8 

	push 0
	call ExitProcess@4
main ENDP
END main