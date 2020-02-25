; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_write.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ajeannot <ajeannot@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/25 15:49:17 by ajeannot          #+#    #+#              ;
;    Updated: 2020/02/25 16:01:30 by ajeannot         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global  _ft_write

; ssize_t	ft_write(int fd, void const *buf, size_t nbyte);
section .text
_ft_write :
                xor rax, rax
                cmp rsi, 0          ; Vérification si buf == NULL
                jz error
                cmp rdx, 0          ; Vérification si nbyte < 0
                jl error
                mov rax, 0x02000004 ; Envoi du code appel system write dans le registre rax
                syscall             ; Appel write avec les arguments passés en rdi (fd), rsi (buf) et rdx (nb de caractere a afficher)
                jc error
                ret                 ; Retour de la valeur contenue dans le registre rax

error :
                mov rax, -1
                ret
