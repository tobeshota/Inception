## Dockerfileのビルドとコンテナの起動方法
# docker build -t mariadb .
# docker run --name mariadb-container mariadb
# (別ターミナルでdocker exec -it mariadb-container bash)

FROM debian:bookworm

RUN apt update && apt install -y \
	# For mariadb
	mariadb-server \
	# For envsubst
	gettext

# ポートを開ける
EXPOSE 3306

# my.cnfをコンテナの設定ディレクトリにコピー
COPY ./my.cnf /etc/mysql/mariadb.conf.d/

# init.sql をコンテナの初期化ディレクトリにコピー
COPY ./init.sql /tmp/
COPY ./entrypoint.sh /tmp/
RUN chmod +x /tmp/entrypoint.sh

# https://qiita.com/takeyu1013/items/4b0b59d46956839b0f74
# 最後にVOLUMEでコンテナ内のMariaDBのデータをローカルに保存します。
# これの目的は、MariaDBのコンテナを停止してもデータが消えないように、ローカルにセーブデータを保存することです。
VOLUME /var/lib/mysql

# MariaDBサーバがUnixソケットファイル（/run/mysqld/mysqld.sock）を作成するためのディレクトリを作成する
RUN mkdir -p /run/mysqld

ENTRYPOINT [ "/tmp/entrypoint.sh" ]
