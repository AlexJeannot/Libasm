; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcmp.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ajeannot <ajeannot@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/25 15:49:40 by ajeannot          #+#    #+#              ;
;    Updated: 2020/02/25 16:00:00 by ajeannot         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global  _ft_strcmp
extern  _ft_strlen

; int ft_strcmp(char *s1, char *s2);
section .text
_ft_strcmp :

                    push rbp            ; Envoi  du registre rbp dans la pile
                    mov rbp, rsp        ; Envoi de la valeur de rsp dans rbp

                    call _ft_strlen     ; Appel de la fonction strlen afin d'obtenir la longueur de la string contenue dans le registre rdi
                    mov rcx, rax        ; Envoi de la valeur récupérée dans le registre rcx

                    push rdi            ; Envoi de l'adresse contenue dans rdi dans la pile (sauvegarde)
                    mov rdi, rsi        ; Envoi de l'adresse contenue dans rsi dans rdi (second paramètre)
                    call _ft_strlen     ; Nouveau appel à strlen afin d'obtenir la longueur de la seconde string

                    pop rdi             ; Récupération de l'adresse initiale contenue dans rdi (premier paramètre)
                    cmp rcx, rax        ; Comparaison de la longueur de la première string et de la seconde string
                    je comparison_loop  ; Si longueur égale alors envoi dans sous partie de comparaison
                    jg first_str        ; Si première string supérieure alors envoi vers sous partie retour 1
                    jl second_str       ; Si seconde string supérieure alors envoi vers sous partie retour 2

comparison_loop:
                    repe cmpsb          ; Tant que les caractères de la première et de la seconde string sont similaires alors la comparaison continue
                    je equal_str        ; Si caractères finaux similaires alors envoi vers sous partie retour égal
                    jl first_str        ; Si caractère première string supérieur alors envoi vers sous partie retour 1
                    jg second_str       ; Si caractère seconde string supérieur alors envoi vers sous partie retour 2

first_str :
                    mov rax, 1          ; Envoi de la valeur 1 dans le registre rax
                    jmp return          ; Envoi vers sous partie retour

second_str :
                    mov rax, -1         ; Envoi de la valeur -1 dans le registre rax
                    jmp return          ; Envoi vers sous partie retour

equal_str :
                    mov rax, 0          ; Envoi de la valeur 0 dans le registre rax
                    jmp return          ; Envoi vers sous partie retour

return :
                    leave               ; Réagencement de la pile (équivalent à add rsp, 8 ET mov rbp, rsp)
                    ret                 ; Retour de la valeur contenue dans le registre rax
