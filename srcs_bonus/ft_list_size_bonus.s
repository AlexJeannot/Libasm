; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_size_bonus.s                               :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ajeannot <ajeannot@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/25 16:25:26 by ajeannot          #+#    #+#              ;
;    Updated: 2020/02/25 16:25:27 by ajeannot         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global  _ft_list_size

; int		ft_list_size(t_list *begin_list);
section .text
_ft_list_size :
                xor rax, rax
                cmp rdi, 0              ; Vérifiation si *begin == NULL
                jz return

browse_list :
                inc rax
                cmp BYTE [rdi + 8], 0   ; Comparaison de elem->next avec NULL
                jz return               ; Si comparaison OK alors fin de la liste
                mov rdi, [rdi + 8]      ; Autrement elem = elem->next
                jmp browse_list         ; Envoi au debut de la sous partie

return :
                ret
