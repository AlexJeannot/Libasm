section   .text
    global _ft_strlen
_ft_strlen :
        mov rcx, 0
        mov rax, 0
        start :
            cmp byte [rcx + rdi], 0x0
            jz end
            inc rcx
            jmp start

        end :
            mov rax, rcx
            ret
