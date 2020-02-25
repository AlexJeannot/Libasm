; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_sort_bonus.s                               :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ajeannot <ajeannot@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/25 15:43:07 by ajeannot          #+#    #+#              ;
;    Updated: 2020/02/25 15:57:36 by ajeannot         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global  _ft_list_sort

; void		ft_list_sort(t_list **begin_list,int (*cmp)());
section .text
_ft_list_sort :
                    mov r9, rsi             ; Stockage adresse fonction
                    mov r13, [rdi]          ; Stockage *begin_list
                    mov r10, [rdi]          ; Definition du contenu de r10 sur *begin_list
                    jmp set_comparison

inc_displacement :
                    mov r10, [r10 + 8]      ; Incrementation du pointeur de deplacement global

set_comparison :
                    cmp r10, 0              ; Comparaison entre adresse du pointeur de deplacement global et null
                    jz return               ; Si comparaison OK alors fin de fonction
                    mov r11, r13            ; Autrement définition du contenu de r11 sur l'adresse du premier élément (*begin_list)

comparison :
                    mov r12, [r11 + 8]      ; Définition du contenu de r12 sur l'élément suivant
                    cmp r12, 0              ; Comparaison de l'élément suivant avec null
                    jz inc_displacement     ; Si comparaison OK alors saut vers sous partie inc_displacement
                    mov rdi, [r11]          ; Autrement définition du premier argument sur element->data
                    mov rsi, [r12]          ; Définition du second argument sur element->next->data
                    mov rax, r9             ; Définition du contenu de rax sur l'adresse de la fonction
                    call rax                ; Appel de la fonction
                    cmp rax, 0              ; Comparaison du retour de la fonctiion
                    jg swap                 ; Si retour supérieur à zéro alors swap

inc_comparison :
                    mov r11, [r11 + 8]      ; Passage à l'élément suivant (équivalent à begin = begin->next)
                    jmp comparison

swap :
                    mov rdx, [r11]          ; Stockage du contenu data du premier élément dans rdx
                    mov rcx, [r12]          ; Stockage du contenu data du second élément dans rcx
                    mov [r12], rdx          ; Stockage du contenu data du premier élément dans le second
                    mov [r11], rcx          ; Stockage du contenu data du second élément dans le premier
                    jmp inc_comparison

return :
                    ret
