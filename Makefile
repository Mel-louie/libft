NAME = libft.a

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
	@printf "[ compiling libft ]\t...\n"
	@printf "[ created ] \t\t$(NAME) "

$(OBJ_PATH):
	@mkdir $@

$(OBJ_PATH)%.o: $(SRC_PATH)%.c
	@gcc $(CFLAGS) -o $@ -c $< 

$(NAME): $(OBJ)
	@ar rc $(NAME) $(OBJ)

clean:
	@rm -rf $(OBJ)
	@rm -rf $(OBJ_PATH)
	@printf "[ deleted ] \t\tobjects\n"


fclean: clean
	@rm -f $(NAME)
	@printf "[ deleted ] \t\t$(NAME)\n\n"

re: fclean all

os:
	@echo $(_CYAN)"The OS is currently: "$(_END)$(_YELLOW)$(OS_NAME)$(_END)

norminette :
	@echo "\033[1;37m"
	@norminette --version
	@echo "\nNorming...\033[0m\n"
	@echo "SRCS:"
	@norminette *.c
	@echo "\nINCLUDES:"
	@norminette ./includes/*.h

.PHONY:		all clean fclean re
