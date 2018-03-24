; 64-BIT Template

ExitProcess PROTO

.data
sum DWORD 0

.code
main PROC
  mov rax, 0
  add rax, 1
  add rax, 5

  call ExitProcess
main ENDP
END