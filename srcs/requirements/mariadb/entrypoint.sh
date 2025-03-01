#!/bin/bash

# /tmp/init_substituted.sqlが存在しない場合は初回起動とみなして初期化処理を実行する
init_database() {
    if [ ! -f /tmp/init_substituted.sql ]; then
        echo "Initializing database..."
        # init.sql内の環境変数を envsubst で置換し、my.cnfでinit_file指定のファイルに出力
        envsubst < /tmp/init.sql > /tmp/init_substituted.sql
    else
        echo "Database already initialized."
    fi
}

# mariadbを更新または初期化する
install_mariadb() {
    if ls /var/lib/mysql/mysql/user.* > /dev/null 2>&1; then
        echo "Already initialized."


        # 既存のデータディレクトリ（/var/lib/mysql）にシステムテーブル（特にmysql.user）が存在する場合，
        # テーブルの互換性をmariadbサーバのバージョンと合わせること（mysql_upgrade）が必要となる．
        # mysql_upgradeはMariaDBサーバが稼働している状態で実行する必要があるため，
        # バックグランドでサーバを起動している．

        # # mariaDBサーバのプロセスをバックグラウンドで起動
        # mysqld --skip-networking --socket=/run/mysqld/mysqld.sock &
        # pid="$!"
        # # ソケットが作成されるのを待つ（mysql_upgradeにはソケットでの接続が必要となるため）
        # until mysqladmin --socket=/run/mysqld/mysqld.sock ping --silent; do
        #     sleep 1
        # done
        # echo "Running mysql_upgrade..."
        # mysql_upgrade --user=mysql
        # # mariaDBサーバのプロセスを終了
        # echo "Shutting down temporary server..."
        # mysqladmin --socket=/run/mysqld/mysqld.sock shutdown
        # # mariaDBサーバのプロセス終了を待つ
        # wait "$pid"
    else
        # MariaDBのデータディレクトリを初期化
        echo "Running mysql_install_db..."
        mysql_install_db --user=mysql --datadir=/var/lib/mysql
    fi
}

main() {
    init_database
    install_mariadb
    # MariaDBサーバを実行
    exec mysqld
}

main
