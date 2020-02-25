# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ajeannot <ajeannot@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/02/25 11:41:09 by ajeannot          #+#    #+#              #
#    Updated: 2020/02/25 16:27:18 by ajeannot         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS		=	srcs/ft_strlen.s	\
				srcs/ft_write.s		\
				srcs/ft_read.s		\
				srcs/ft_strcmp.s	\
				srcs/ft_strcpy.s	\
				srcs/ft_strdup.s

SRCS_BONUS	=	srcs_bonus/ft_atoi_base_bonus.s			\
				srcs_bonus/ft_list_push_front_bonus.s	\
				srcs_bonus/ft_list_size_bonus.s			\
				srcs_bonus/ft_list_sort_bonus.s			\
				srcs_bonus/ft_list_remove_if_bonus.s

ASM			=	nasm
ASM_FLAGS	=	-f macho64
FLAGS 		=	-Wall -Werror -Wextra
COMP		= 	-L . -lasm -o

NAME		=	libasm.a
EXEC		=	LIBASM
EXEC_BONUS	=	LIBASM_BONUS

OBJS		=	$(SRCS:.s=.o)
OBJS_BONUS	=	$(SRCS_BONUS:.s=.o)

%.o:			%.s
				$(ASM) $(ASM_FLAGS) $<

all:			$(NAME)

$(NAME):		$(OBJS)
				ar rcs $(NAME) $(OBJS)

bonus :			$(NAME) $(OBJS) $(OBJS_BONUS)
				ar rcs $(NAME) $(OBJS) $(OBJS_BONUS)

test:			all
				gcc $(FLAGS) $(COMP) $(EXEC) srcs/main.c
				./$(EXEC)

test_bonus :	bonus
				gcc $(FLAGS) $(COMP) $(EXEC_BONUS) srcs_bonus/main_bonus.c
				./$(EXEC_BONUS)

clean:
				rm -rf $(OBJS)
				rm -rf $(OBJS_BONUS)

fclean:			clean
				rm -rf $(NAME)
				rm -rf $(EXEC)
				rm -rf $(EXEC_BONUS)

re:				fclean all

.PHONY: 		clean fclean all re
.SILENT:
