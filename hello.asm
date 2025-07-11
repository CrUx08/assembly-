section .data
    message db 'Hello, World!', 0xA  ; 0xA = newline
    msg_len equ $ - message          ; calculate message length

section .text
    global _start

_start:
    ; write(stdout, message, msg_len)
    mov eax, 4        ; syscall number for sys_write (4)
    mov ebx, 1        ; file descriptor 1 = stdout
    mov ecx, message  ; pointer to message
    mov edx, msg_len  ; length of message
    int 0x80          ; make syscall

    ; exit(0)
    mov eax, 1        ; syscall number for sys_exit (1)
    xor ebx, ebx      ; return code 0
    int 0x80
