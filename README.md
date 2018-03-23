## Assembly Language programming under Windows


```
; 32-BIT Template

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
sum DWORD 0

.code
main PROC
	INVOKE ExitProcess, 0 ;program terminates with return 0
main ENDP
END main
```


```
; 64-BIT Template

ExitProcess PROTO

.data
sum DWORD 0

.code
main PROC
  mov ecx, 0
  call ExitProcess
main ENDP
END main
```
