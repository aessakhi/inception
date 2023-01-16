# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aessakhi <aessakhi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/09 12:14:01 by aessakhi          #+#    #+#              #
#    Updated: 2022/11/18 19:11:04 by aessakhi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = inception

DOCKERCOMPOSE = srcs/docker-compose.yml

all: $(NAME)

inception:
	mkdir -p /home/aessakhi/data/wordpress /home/aessakhi/data/mysql
	docker compose -f $(DOCKERCOMPOSE) up -d

stop:
	cd srcs/ && docker compose down

clean: stop
	docker system prune -a -f

fclean: clean
		sudo rm -rf /home/aessakhi/data/*
		docker volume rm `docker volume ls -q`

re: fclean all
