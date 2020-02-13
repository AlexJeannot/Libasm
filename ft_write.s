

section   .text
    global _ft_write
_ft_write :
        start:
            mov rax, 0x02000004
            syscall
            mov rax, 0x02000001
            xor rdi, rdi
            syscall
            ret
