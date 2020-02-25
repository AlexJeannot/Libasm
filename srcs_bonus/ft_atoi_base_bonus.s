; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_atoi_base_bonus.s                               :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ajeannot <ajeannot@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/25 15:49:57 by ajeannot          #+#    #+#              ;
;    Updated: 2020/02/25 15:50:41 by ajeannot         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global  _ft_atoi_base

; int ft_atoi_base(char *str, char *base)
section .text
_ft_atoi_base :

base_start :
                xor rax, rax ; Registre rax défini sur zéro 9 (retour)
                xor rcx, rcx ; Registre rcx défini sur zéro (compteur boucle)
                mov r11, 1 ; Registre r11 défini sur 1 (signe de nb)
                jmp base_car

base_inc :
                inc rcx ; Incrementation de rcx pour acceder au caractere suivant (rsi = base)

base_car :
                cmp BYTE [rsi + rcx], 0     ; Comparaison du caractère avec caractère null
                jz base_end                 ; Si comparaison OK alors saut vers sous partie base_end
                cmp BYTE [rsi + rcx], 9     ; Comparaison du caractère avec caractères invalides (whitespaces + -)
                jz base_ko                  ; Si comparaison OK alors saut vers sous partie base_ko
                cmp BYTE [rsi + rcx], 10
                jz base_ko
                cmp BYTE [rsi + rcx], 11
                jz base_ko
                cmp BYTE [rsi + rcx], 12
                jz base_ko
                cmp BYTE [rsi + rcx], 32
                jz base_ko
                cmp BYTE [rsi + rcx], 43
                jz base_ko
                cmp BYTE [rsi + rcx], 45
                jz base_ko
                mov BYTE r9b, [rsi + rcx]   ; Envoi de l'adresse du caractère dans le registre r9 (b pour spécifier taille)
                mov r10, rcx                ; Envoi de l'adresse de l'index actuel dans r10
                inc r10                     ; Incrementation de l'adresse pour passer au caractère suivant

base_cmp :
                cmp BYTE [rsi + r10], 0     ; Comparaison du caractère suivant avec caractère null
                jz base_inc                 ; Si comparaison OK alors on passe au caractère suivant
                cmp r9b, [rsi + r10]        ; Comparaison du caractère actuel avec caractère actuel + n
                jz base_ko                  ; Si comparaison OK alors saut vers sous partie base_ko
                inc r10                     ; Incrementation de r10 afin de passer au caractère suivant
                jmp base_cmp                ; Boucle sur sous partie base_cmp

base_ko :
                ret                         ; Si base KO alors retour de zéro

base_end :
                cmp rcx, 2                  ; Comparaison taille de la base avec 2
                jl base_ko                  ; Si inférieure alors saut vers sous partie base_ko
                mov rdx, rcx                ; Autrement stockage taille de base dans le registre rdx
                xor rcx, rcx                ; Registre rcx défini sur zéro
                jmp str_car

str_inc :
                inc rcx                     ; Incrementation de rcx pour acceder au caractere suivant (rdi = str)

str_car :
                cmp BYTE [rdi + rcx], 9     ; Comparaison du caractère avec caractères whitespaces ou +
                jz str_inc                  ; Si comparaison OK alors saut vers sous partie str_inc
                cmp BYTE [rdi + rcx], 10
                jz str_inc
                cmp BYTE [rdi + rcx], 11
                jz str_inc
                cmp BYTE [rdi + rcx], 12
                jz str_inc
                cmp BYTE [rdi + rcx], 32
                jz str_inc
                cmp BYTE [rdi + rcx], 43
                jz str_inc
                cmp BYTE [rdi + rcx], 45    ; Comparaison du caractère avec caractère -
                jz neg_nb                   ; Si comparaison OK alors saut vers sous partie neg_nb

calcul_start :
                cmp BYTE [rdi + rcx], 0     ; Après comparaison du caractère avec caractères à passer, comparaison avec caractère null
                jz calcul_end               ; Si comparaison OK alors saut vers sous partie calcul_end (retour valeur finale)

index_start :
                xor r9, r9                  ; Autrement début de la recherche de l'index dans la base
                xor r8, r8
                mov r9b, BYTE [rdi + rcx]   ; Envoi de l'adresse du caractère dans le registre r9 (b pour spécifier taille)

index_base :
                cmp BYTE [rsi + r8], 0      ; Vérification si string base finie
                jz calcul_end
                cmp BYTE [rsi + r8], r9b    ; Comparaison entre caractère str actuel et caractère base
                jz add_nb                   ; Si comparaison OK alors saut vers sous partie add_nb

nb_inc :
                inc r8                      ; Autrement incrementation de la valeur contenue dans r8 pour parcourir la string base
                jmp index_base

add_nb :
                imul rax, rdx               ; Multiplication du nb final avec la base
                add rax, r8                 ; Ajout du nb (index matché dans la string base)
                inc rcx                     ; Incrementation de la valeur contenue dans rcx pour parcourir la string str
                cmp BYTE [rdi + rcx], 0     ; Comparaison du caractère avec caractère null
                jnz index_start             ; Si comparaison KO alors saut vers la sous partie index_start

calcul_end :
                mul r11                     ; Multiplication de la valeur contenue dans rax avec valeur contenue dans r11 (1 ou -1)
                ret                         ; Retour de la valeur contenue dans rax

neg_nb :
                imul r11, -1                ; Mutiplicatione de la valeur contenue dans r11 (1 ou -1) avec -1 si signe - dans str
                jmp str_inc                 ; Saut vers la sous partie str_inc pour continuer de parcourir str
