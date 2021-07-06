NAME = libft.a

#	COLORS	#
_BLACK		= "\033[30m"
_RED		= "\033[31m"
_GREEN		= "\033[32m"
_YELLOW		= "\033[33m"
_BLUE		= "\033[34m"
_PURPLE		= "\033[35m"
_CYAN		= "\033[36m"
_WHITE		= "\033[37m"
_END		= "\033[0m"
#	bold	#
B_BLACK		= "\033[1;30m"
B_RED		= "\033[1;31m"
B_GREEN		= "\033[1;32m"
B_YELLOW	= "\033[1;33m"
B_BLUE		= "\033[1;34m"
B_PURPLE	= "\033[1;35m"
B_CYAN		= "\033[1;36m"
B_WHITE		= "\033[1;37m"

SRC_NAME =	ft_atoi.c \
		ft_bzero.c \
		ft_calloc.c \
		ft_frees.c \
		ft_isdigit.c \
		ft_itoa.c  \
		ft_puts.c \
		ft_split.c \
		ft_strs.c \
		ft_strns.c \
		ft_strjoinfree.c \
		ft_swaps.c \
		ft_tab.c \
		get_next_line.c

SRC_PATH = ./srcs/
OBJ_PATH = ./objs/

OBJ_NAME = $(SRC_NAME:.c=.o)
SRC = $(addprefix $(SRC_PATH), $(SRC_NAME))
OBJ = $(addprefix $(OBJ_PATH), $(OBJ_NAME))

CFLAGS = -Wall -Wextra -Werror

all: $(OBJ_PATH) $(NAME)
	@printf $(B_WHITE)"[ compiling libft ]" 
	@printf $(B_YELLOW)"\t...\n"$(_END)
	@printf $(B_WHITE)"[ created ]"
	@printf $(B_GREEN)"\t\t$(NAME) "$(_END)

$(OBJ_PATH):
	@mkdir $@

$(OBJ_PATH)%.o: $(SRC_PATH)%.c
	@gcc $(CFLAGS) -o $@ -c $< 

$(NAME): $(OBJ)
	@ar rc $(NAME) $(OBJ)

clean:
	@rm -rf $(OBJ)
	@rm -rf $(OBJ_PATH)
	@printf $(B_WHITE)"[ deleted ]"$(_END)
	@printf $(B_RED)"\t\tobjects\n"$(_END)

fclean: clean
	@rm -f $(NAME)
	@printf $(B_WHITE)"[ deleted ]"$(_END)
	@printf $(B_RED)"\t\t$(NAME)\n"$(_END)

re: fclean all

norminette :
	@echo "\033[1;37m"
	@norminette --version
	@echo "\nNorming...\033[0m\n"
	@echo "SRCS:"
	@norminette *.c
	@echo "\nINCLUDES:"
	@norminette ./includes/*.h

.PHONY:		all clean fclean re
