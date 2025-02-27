#!/bin/bash
set -e

# データベースの初期化チェック:
# /tmp/init_substituted.sqlが存在しない場合は初回起動とみなして初期化処理を実行
if [ ! -f /tmp/init_substituted.sql ]; then
    echo "Initializing database..."

    # mysql_install_db を使用して、MySQL/MariaDBのデータディレクトリを初期化
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

    # init.sql内の環境変数を envsubst で置換し、my.cnfでinit_file指定のファイルに出力
    envsubst < /tmp/init.sql > /tmp/init_substituted.sql
fi

# 初期化済みの場合は、通常の起動方法でMySQLサーバを実行
exec mysqld
