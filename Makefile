COMPOPSE_FILE = ./srcs/docker-compose.yml

all: up

re: clean all

RE: bals all

clean:
	# --rmi all: すべてのイメージを削除する．イメージがコンテナによって使用されている場合，コンテナも削除される．
	# --volumes: ボリュームを削除する
	docker-compose -f ${COMPOPSE_FILE} down --rmi all --volumes

bals:
	# すべてのコンテナを削除
	docker rm -f `docker ps -aq` | true
	# すべてのイメージを削除
	docker rmi -f `docker images -q` | true
	# すべての未使用データを削除
	docker system prune -a -f --volumes | true
	# すべてのネットワークを削除
	docker network prune -f | true
	# すべてのボリュームを削除
	docker volume rm `docker volume ls -q` | true

up:
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
