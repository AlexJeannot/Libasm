SRCS = ft_strlen.s ft_write.s

NA			=	nasm
NA_FLAGS	=	-f macho64
FLAGS 		=	-Wall -Werror -Wextra
NAME		=	libasm.a
TEST		=	test

OBJS = $(SRCS:.s=.o)

%.o:			%.s
				$(NA) $(NA_FLAGS) $<

all:			$(NAME)

$(NAME):		$(OBJS)
				ar rcs $(NAME) $(OBJS)

clean:
				rm -rf $(OBJS)

fclean:
				rm -rf $(OBJS)
				rm -rf $(NAME)

re:				fclean all

comp:			re
				gcc $(FLAGS) -L . -lasm -o $(TEST) main.c
				echo " ----- RESULT -----"
				./$(TEST)

.SILENT :
