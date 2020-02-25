; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_remove_if_bonus.s                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ajeannot <ajeannot@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/25 16:25:16 by ajeannot          #+#    #+#              ;
;    Updated: 2020/02/25 16:25:17 by ajeannot         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global  _ft_list_remove_if

; 	void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void*));
section .text
_ft_list_remove_if :
                            push rbp ; Envoi  du registre rbp dans la pile
                            mov rbp, rsp ; Envoi de la valeur de rsp dans rbp
                            mov r9, rsi ; Envoi de data_ref dans la r9
                            mov r10, rdx ; Envoi de la fonction cmp dans la r10
                            mov r11, rcx ; Envoi de la fonction free dans la r11
                            mov r12, rdi ; Envoi de **begin dans la r12

first_comparison :
                            mov r13, [r12] ; Envoi de *begin dans r13
                            cmp r13, 0 ; Comparaison de *begin avec NULL
                            jz return ; Si comparaison OK alors fin de la fonction
                            mov rdi, [r13] ; Autrement Envoi de begin->data dans rdi
                            mov rsi, r9 ; Envoi de data_ref dans rsi
                            mov rax, r10 ; Envoi de la fonction cmp dans rax
                            call rax ; Appel de la fonction cmp
                            cmp rax, 0 ; Si begin->data != data_ref alors saut vers following_comparisons
                            jnz following_comparisons
                            mov rdi, [r13]; Autrement Envoi de begin->data dans rdi
                            mov rax, r11 ; Envoi de la fonction free dans rax
                            push r9
                            push r10
                            push r11
                            call rax ; Appel de la fonction free
                            pop r11
                            pop r10
                            pop r9
                            mov QWORD [r13], 0 ; begin->data = NULL
                            xor rcx, rcx
                            mov rcx, [r13 + 8] ; Envoi de l'adresse sous begin->next dans rcx
                            mov [r12], rcx ; **begin = begin->next
                            jmp first_comparison

inc_comparison :
                            xor rcx, rcx
                            mov rcx, r14 ; begin = begin->next
                            mov r13, rcx

following_comparisons :
                            mov r14, [r13 + 8] ; Envoi de l'adresse sous begin->next dans r14
                            cmp r14, 0
                            jz return
                            mov rdi, [r14]
                            mov rsi, r9
                            mov rax, r10
                            call rax
                            cmp rax, 0
                            jnz inc_comparison ; Passage à l'élement de liste suivant
                            mov rdi, [r14]
                            mov rax, r11
                            push r9
                            push r10
                            push r11
                            call rax
                            pop r11
                            pop r10
                            pop r9
                            mov QWORD [r14], 0
                            xor rcx, rcx
                            mov rcx, [r14 + 8] ; Envoi de l'adresse sous begin->next->next dans rcx
                            mov [r13 + 8], rcx ; Envoi de l'adresse sous begin->next = begin->next->next
                            jmp following_comparisons

return :
                            leave
                            ret
