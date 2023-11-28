
NAME = Inception

all:
	docker compose -f -p ${NAME} srcs/docker-compose.yml up

clean:
	docker compose -f -p ${NAME} srcs/docker-compose.yml down

fclean: clean
	sudo rm -rf /home/${USER}/data/db/*
	sudo rm -rf /home/${USER}/data/wp/*
	docker system prune -a 

re: fclean all

.PHONY: all clean fclean re