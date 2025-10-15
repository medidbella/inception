NAME = inception
COMPOSE_FILE = ./srcs/docker-compose.yml
DB_VOLUME_PATH = /home/midbella/data/mariadb/
WP_VOLUME_PATH = /home/midbella/data/wordpress/

up:
	mkdir -p $(DB_VOLUME_PATH)
	mkdir -p $(WP_VOLUME_PATH)
	docker-compose -f $(COMPOSE_FILE) -p $(NAME) up --build -d 

down:
	docker-compose -f $(COMPOSE_FILE) -p $(NAME) down

clean: down
	docker volume rm $$(docker volume ls) 2> /dev/null || true
	sudo rm -rf $(DB_VOLUME_PATH) $(WP_VOLUME_PATH)

fclean: clean
	@docker rmi -f $$(docker images -qa) 2> /dev/null || true
