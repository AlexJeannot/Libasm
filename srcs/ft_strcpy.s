; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ajeannot <ajeannot@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/25 15:49:33 by ajeannot          #+#    #+#              ;
;    Updated: 2020/02/25 16:00:48 by ajeannot         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global  _ft_strcpy
extern  _ft_strlen

; char *ft_strcpy(char *dest, const char *src);
section .text
_ft_strcpy :
                push rbp            ; Envoi du registre rbp dans la pile
                mov rbp, rsp        ; Envoi de la valeur de rsp dans rbp

                cmp rdi, 0          ; Comparaison premier caractère dest avec caractère null
                jz set_null         ; Si oui alors envoi vers sous partie set_null
                cmp rsi, 0          ; Comparaison premier caractère src avec caractère null
                jz set_null         ; Si oui alors envoi vers sous partie set_null

                push rdi            ; push de dest dans la pile (sauvegarde)
                mov rdi, rsi        ; Envoi de src dans le registre rdi pour ft_strlen
                call _ft_strlen     ; Appel de strlen pour connaitre la longueur de src
                pop rdi             ; recupération de l'adresse de dest

                inc rax             ; Incrémentation retour de ft_strlen pour caractère null en fin de string
                mov rcx, rax        ; Envoi du resultat de strlen dans rcx pour compteur de copy
                xor rax, rax        ; Mise a zero du registre rax

                push rcx            ; Envoi de la valeur de rcx dans la pile pour sauvegarde de la taille de str
                rep movsb           ; Copie des bits contenus dans le registre rdi dans le registre rdi pour rcx octets
                pop rcx             ; Recuperation de la longueur de src

                sub rdi, rcx        ; soustraction afin d'obtenir l'adresse du premier caractère
                lea rax, [rdi]      ; Envoi de l'adresse de rdi dans le registre rax
                jmp return          ; Saut vers la sous partie return

set_null :
                mov rdi, 0          ; Set de dest à null
                lea rax, [rdi]      ; Envoi de l'adresse de rdi dans le registre rax
                jmp return          ; Saut vers la sous partie return

return :
                leave               ; Réagencement de la pile (équivalent à add rsp, 8 ET mov rbp, rsp)
                ret                 ; Retour de la valeur contenue dans le registre rax
