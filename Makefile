NAME = inception
COMPOSE_FILE = ./srcs/docker-compose.yml
DB_VOLUME_PATH = /home/midbella/data/mariadb/
WP_VOLUME_PATH = /home/midbella/data/wordpress/


up:
	mkdir -p $(DB_VOLUME_PATH)
	mkdir -p $(WP_VOLUME_PATH)
	docker-compose -f $(COMPOSE_FILE) -p $(NAME) up -d 

down:
	docker-compose -f $(COMPOSE_FILE) -p $(NAME) down

clean:
	docker volume rm $(docker volume ls) 2> /dev/null || true

fclean: clean
	@docker rmi -f $$(docker images -qa) 2> /dev/null || true
