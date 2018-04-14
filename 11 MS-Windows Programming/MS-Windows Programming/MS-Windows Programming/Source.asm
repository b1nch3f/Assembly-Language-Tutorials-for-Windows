; 32-BIT Template

.386
.model flat,stdcall
.stack 4096

STD_INPUT_HANDLE	EQU -10
STD_OUTPUT_HANDLE	EQU -11
STD_ERROR_HANDLE	EQU -12

HANDLE TEXTEQU <DWORD>

GetStdHandle PROTO,
	nStdHandle:HANDLE

WriteConsoleA PROTO,
	hConsoleOutput:HANDLE,
	lpBuffer:PTR BYTE,
	nNumberOfCharsToWrite:DWORD,
	lpNumberOfCharsWritten:PTR DWORD,
	lpReserved:DWORD

ExitProcess PROTO, 
	dwExitCode:DWORD

.data
myStr			BYTE "Hello-world", 0dh, 0ah
myStrSize		DWORD ($ - myStr)
consoleHandle	DWORD 0
bytesWritten	DWORD ?

.code
main PROC
	push STD_OUTPUT_HANDLE
	call GetStdHandle
	mov consoleHandle, eax ;preserve handle, we'll use this in WriteConsoleA API call

	push 0
	push OFFSET bytesWritten
	push myStrSize
	push OFFSET myStr
	push consoleHandle
	call WriteConsoleA

	push 0
	call ExitProcess
main ENDP
END main