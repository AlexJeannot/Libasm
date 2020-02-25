; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ajeannot <ajeannot@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/25 15:49:28 by ajeannot          #+#    #+#              ;
;    Updated: 2020/02/25 16:24:59 by ajeannot         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global  _ft_strdup
extern  _malloc
extern  _ft_strlen
extern  _ft_strcpy

; char *ft_strdup(const char *s);
section .text
_ft_strdup :
                cmp rdi, 0      ; Vérification si s == NULL
                jz error
                push rbp        ; Envoi du registre rbp dans la pile
                mov rbp, rsp    ; Envoi de la valeur de rsp dans rbp
                sub rsp, 8      ; alignement de la pile
                call _ft_strlen ; Appel a strlen pour connaitre le nombre d'octets à alouer
                push rdi        ; Envoi de la string a dupliquer dans la pile (sauvegarde)
                inc rax         ; Incrementation de rax pour la caractère null
                mov rdi, rax    ; Envoi du nombre d'octets dans le registre rdi (argument malloc)
                call _malloc    ; Appel a malloc
                cmp rax, 0      ; Comparaison retour avec zero (sécurité si retour null)
                jz error_malloc ; Si erreur alors envoi vers sous partie error_malloc
                pop rsi         ; Recupération de la string a dupliquer dans le registre rsi
                mov rdi, rax    ; Envoi du retour de malloc (adresse espace memoire aloué) dams le registre rsi
                call _ft_strcpy ; Appel de strcpy avec les arguments : espace mémoire (rdi) et string a copier (rsi)
                add rsp, 8      ; Réalignement de la pile
                jmp return      ; Saut vers la sous partie return

error_malloc:
                add rsp, 8      ; Réalignement de la pile
                jmp return      ; Saut vers la sous partie return

return :
                leave           ; Réagencement de la pile (équivalent à add rsp, 8 ET mov rbp, rsp)
                ret             ; Retour de la valeur contenue dans le registre rax

error :
                mov rax, 0
                ret
