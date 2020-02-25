; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ajeannot <ajeannot@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/25 15:49:24 by ajeannot          #+#    #+#              ;
;    Updated: 2020/02/25 16:01:19 by ajeannot         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global      _ft_strlen

; size_t	ft_strlen(const char *s);
section     .text
_ft_strlen :
                xor rax, rax                ; positionnement des bits à zéro (équivalent à mov rax, 0)
                cmp rdi, 0
                jz return

count_loop :
                cmp byte [rax + rdi], 0x0   ; comparaison des caractères avec le caractère nul
                jz return                   ; Si Zero flag à 1 (comparaison égale à zéro)
                inc rax                     ; incrémentation de rax afin de passer au caractère suivant
                jmp count_loop              ; Renvoi vers le début de la sous partie count_loop

return :
                ret                         ; Retour de rax
