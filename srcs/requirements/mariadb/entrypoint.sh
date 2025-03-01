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
