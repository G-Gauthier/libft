# option

CC = gcc
FLAGS = -Wall -Werror -Wextra -g

# path

HEADER = includes/
SRCDIR = srcs/

# Files

NAME = libft.a

SRC = ft_putchar.c

O_FILES = $(SRC:.c=.o)

STATE = Updated

.PHONY: all clean fclean re

all: $(NAME)

$(NAME): $(O_FILES)
	@ranlib $(NAME)
	@echo "\n\033[1;32mlibft: Ok\033[0m"

%.o: $(SRCDIR)%.c
	@echo -n .
	@$(CC) -o $@ $(FLAGS) -I $(HEADER) -c $<
	@ar -rcs $(NAME) $@

clean:
	@rm -f $(O_FILES)

fclean: clean
	$(eval STATE = Created)
	@rm -f $(NAME)

re: fclean all