COMPOPSE_FILE = ./srcs/docker-compose.yml

all: up

re: down up

rm:
	docker-compose -f ${COMPOPSE_FILE} rm

up:
	docker-compose -f ${COMPOPSE_FILE} up -d

down:
	docker-compose -f ${COMPOPSE_FILE} down

stop:
	docker-compose -f ${COMPOPSE_FILE} stop

start:
	docker-compose -f ${COMPOPSE_FILE} start

ps:
	docker-compose -f ${COMPOPSE_FILE} ps

restart:
	docker-compose -f ${COMPOPSE_FILE} restart

.PHONY: all up down stop start ps restart
