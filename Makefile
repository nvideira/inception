all: start

start:
		mkdir -p /home/nvideira/data/mysql
		mkdir -p /home/nvideira/data/wordpress
		docker compose -f ./srcs/docker-compose.yml up -d

down:
		docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes

stop:
		docker-compose -f ./srcs/docker-compose.yml stop

clean: down
		rm -rf /home/nvideira/data;

re: clean start

.PHONY: start down stop clean