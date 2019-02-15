# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: scoron <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/06 17:44:30 by scoron            #+#    #+#              #
#    Updated: 2019/02/15 16:57:33 by scoron           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = 

FLAGS= -Wall -Wextra -Werror

SRCS_NAME = 

HEADER = 

SRCS = $(addprefix srcs/,$(SRCS_NAME))

OBJS = $(addprefix objs/,$(SRCS_NAME:.c=.o))

all : $(NAME)

$(NAME) : lib $(OBJS)
	@ar rc $(NAME) $(OBJS)
	@ranlib $(NAME)

objs/%.o : srcs/%.c includes/$(HEADER)
	@mkdir -p objs
	@clang $(FLAGS) -I includes -c $< -o $@

clean :
	@/bin/rm -f $(OBJS)
	@/bin/rm -rf objs

fclean : clean
	@/bin/rm -f $(NAME)

re : fclean all

lib :
	@make -C libft/

norme:
	norminette ./libft/
	@echo
	norminette ./includes/
	@echo
	norminette ./srcs/

push :
	@git add -A
	@git commit -m "quick push"
	@git push origin master
	git status

.PHONY: all, clean, fclean, re, push, lib, norme
