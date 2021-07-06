# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: louielouie <louielouie@student.42.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/11 15:17:57 by mdesfont          #+#    #+#              #
#    Updated: 2021/07/06 10:37:05 by louielouie       ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

################
#    COLORS    #
################

_BLACK		= "\033[30m"
_RED		= "\033[31m"
_GREEN		= "\033[32m"
_YELLOW		= "\033[33m"
_BLUE		= "\033[34m"
_VIOLET		= "\033[35m"
_CYAN		= "\033[36m"
_WHITE		= "\033[37m"
_END		= "\033[0m"

################
#    DETECT	   #
#	   OS      #
################

OS_NAME := $(shell uname -s | tr A-Z a-z)

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

SRC_PATH = ./src/
OBJ_PATH = ./obj/

OBJ_NAME = $(SRC_NAME:.c=.o)
SRC = $(addprefix $(SRC_PATH), $(SRC_NAME))
OBJ = $(addprefix $(OBJ_PATH), $(OBJ_NAME))


CFLAGS = -Werror -Wall -Wextra

all: $(OBJ_PATH) $(NAME)
	@printf "created: $(NAME)"

$(OBJ_PATH):
	@mkdir $@

$(OBJ_PATH)%.o: $(SRC_PATH)%.c
	@gcc $(CFLAGS) -o $@ -c $< 

$(NAME): $(OBJ)
	@ar rc $(NAME) $(OBJ)

clean:
	/bin/rm -f $(OBJ)
	/bin/rm -rf $(OBJ_PATH)
	@printf "deleted: $(OBJ)\n"


fclean: clean
	/bin/rm -f $(NAME)
	@printf "deleted: $(NAME)\n"

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
