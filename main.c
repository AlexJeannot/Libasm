#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <stddef.h>
#include <string.h>
#include <fcntl.h>
//const char *s, const char *s2
size_t	ft_strlen(const char *s);
ssize_t	ft_write(int fd, void const *buf, size_t nbyte);

int main()
{
    printf("%zu\n", ft_strlen("test"));
    printf("\n%zu\n", ft_write(1, "test", 4));
}

/*

section .text
    global _ft_strlen

 _ft_strlen :
        mov rax, 0
        start :
                cmp message [rax + rdi], 0x0
                jz wri
                jmp incr

        incr :
                inc rax
                inc rcx
                jmp start

        wri :
                mov rax, 0x02000004
                mov rdi, 1
                mov rsi, message
                mov rdx, 13
                syscall
                mov rax, 0x02000001
                xor rdi, rdi
                syscall
        end:
                ret

section   .data
message:        db "Hello, World", 10


*/
