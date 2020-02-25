; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_push_front_bonus.s                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ajeannot <ajeannot@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/21 16:53:07 by ajeannot          #+#    #+#              ;
;    Updated: 2020/02/25 15:58:05 by ajeannot         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global  _ft_list_push_front
extern _malloc

; void	ft_list_push_front(t_list **begin_list, void *data)
section .text
_ft_list_push_front :
                        xor rax,rax
                        push rbp            ; Envoi du registre rbp dans la pile
                        mov rbp, rsp        ; Envoi de la valeur de rsp dans rbp
                        push rdi            ; Stockage de rdi dans la pile
                        push rsi            ; Stockage de rsi dans la pile
                        xor rdi, rdi
                        mov rdi, 16         ; Définition de rdi sur le nongrbe d'octet a malloc (sizeof(t_list))
                        call _malloc        ; Appel de malloc
                        pop rsi
                        pop rdi
                        cmp rax, 0
                        jz error_malloc
                        mov [rax], rsi      ; Définition de data dans elem->data
                        mov rcx, [rdi]      ; Stockage de *begin dans rcs
                        mov [rax + 8], rcx  ; Définition de l'adresse de begin dans elem->next
                        mov [rdi], rax      ; Défition de l'adresse de elem sous **begin
                        leave
                        ret

error_malloc :
                        leave
                        ret
