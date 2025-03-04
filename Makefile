COMPOPSE_FILE = srcs/docker-compose.yml

all: up resolve

re: clean all

clean:
	# --rmi all: すべてのイメージを削除する．イメージがコンテナによって使用されている場合，コンテナも削除される．
	# --volumes: ボリュームを削除する
	docker-compose -f ${COMPOPSE_FILE} down --rmi all --volumes
	docker system prune -a
	sudo rm -rf ~/data/db ~/data/web | true
	sudo mv /etc/hosts.bak /etc/hosts | true

up:
	mkdir -p ~/data/db ~/data/web
	docker-compose -f ${COMPOPSE_FILE} up -d

down:
	docker-compose -f ${COMPOPSE_FILE} down

stop:
	docker-compose -f ${COMPOPSE_FILE} stop

start:
	docker-compose -f ${COMPOPSE_FILE} start

# 名前解決する
resolve:
	sudo cp /etc/hosts /etc/hosts.bak
	sudo chmod 777 /etc/hosts
	sudo printf "\n127.0.0.1 toshota.42.fr" >> /etc/hosts
	sudo chmod 644 /etc/hosts

ps:
	docker-compose -f ${COMPOPSE_FILE} ps -a

restart:
	docker-compose -f ${COMPOPSE_FILE} restart

.PHONY: all up down stop start ps restart
