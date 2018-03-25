; 32-BIT Template

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
myArray dword 0ah, 0bh, 0ch
mylabel label byte
num1	word 1122h
myway	typedef ptr dword
highway myway 0ffh

.code
main proc
	mov eax, dword ptr myArray

	mov eax, type myArray

	mov eax, lengthof myArray

	mov eax, sizeof myArray

	xor eax, eax
	mov	al, mylabel
	mov ah, [mylabel+1]

	xor esi, esi
	xor eax, eax
	mov esi, offset myArray
	mov eax, [esi] 
	mov eax, [esi+4]
	mov eax, [esi+8]

	mov eax, highway

	invoke ExitProcess, 0 ;program terminates with return 0
main endp
end main