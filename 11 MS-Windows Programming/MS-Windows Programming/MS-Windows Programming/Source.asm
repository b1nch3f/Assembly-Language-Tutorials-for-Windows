; 32-BIT Template

.386
.model flat,stdcall
.stack 4096

STD_INPUT_HANDLE	EQU -10
STD_OUTPUT_HANDLE	EQU -11
STD_ERROR_HANDLE	EQU -12

GetStdHandle PROTO,
	nStdHandle:DWORD

WriteConsoleA PROTO,
	hConsoleOutput:DWORD,
	lpBuffer:PTR BYTE,
	nNumberOfCharsToWrite:DWORD,
	lpNumberOfCharsWritten:PTR DWORD,
	lpReserved:DWORD

ExitProcess PROTO, 
	dwExitCode:DWORD

.data
endl		EQU <0dh,0ah>
message		BYTE "Hello world",endl
messageSize	DWORD ($ - message)

consoleHandle	DWORD 0
bytesWritten	DWORD ?

.code
main PROC
	push STD_OUTPUT_HANDLE
	call GetStdHandle
	mov consoleHandle, eax

	push 0
	push OFFSET bytesWritten
	push messageSize
	push OFFSET message
	push consoleHandle
	call WriteConsoleA

	push 0
	call ExitProcess
main ENDP
END main