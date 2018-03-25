; 32-BIT Template

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
num1	byte 8
num2	byte -8

var1	byte 4
var2	byte 5

myArray byte 0ah, 0bh, 0ch

.code
main proc
	movzx	eax, num1
	movsx	ebx, num2

	xor		eax, eax
	mov		ah, var1
	xchg	ah, var2
	mov		var1, ah

	xor		eax, eax
	mov		al, myArray
	mov		al, myArray+1
	mov		al, [myArray+2]

	invoke ExitProcess, 0 ;program terminates with return 0
main endp
end main