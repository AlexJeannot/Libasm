; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_read.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ajeannot <ajeannot@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/25 15:49:45 by ajeannot          #+#    #+#              ;
;    Updated: 2020/02/25 15:59:10 by ajeannot         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global  _ft_read
extern  _ft_strlen

; ssize_t ft_read(int fd, void *buf, size_t count)
section .text
_ft_read :
            xor rax, rax
            cmp rsi, 0          ; Vérification si buf == NULL
            jz error
            cmp rdx, 0          ; Vérification si count < NULL
            jl error
            mov rax, 0x02000003 ; Envoi du code appel system read dans le registre rax
            syscall             ; Appel write avec les arguments passés en rdi (fd), rsi (buf) et rdx (nb de caractere a copier)
            jc error
            ret                 ; Retour de la valeur contenue dans le registre rax

error :
            mov rax, -1
            ret
