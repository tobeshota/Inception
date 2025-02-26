#!/bin/bash
set -e

# データベースの初期化チェック:
# /tmp/init_substituted.sqlが存在しない場合は初回起動とみなして初期化処理を実行
if [ ! -f /tmp/init_substituted.sql ]; then
    echo "Initializing database..."

    # mysql_install_db を使用して、MySQL/MariaDBのデータディレクトリを初期化
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

    # ネットワーク通信を無効化して、MySQLサーバをバックグラウンドで起動
    mysqld_safe --skip-networking &
    pid="$!"  # バックグラウンドプロセスのプロセスIDを保存
    sleep 10  # サーバが完全起動するまで待機

    # init.sql内の環境変数を envsubst で置換し、一時ファイルに出力
    envsubst < /tmp/init.sql > /tmp/init_substituted.sql

    # 置換済みSQLスクリプトを実行して、初期化処理（DB作成やユーザー設定など）を実施
    mysql --user=mysql < /tmp/init_substituted.sql

    # 初期化完了後、MySQLサーバをシャットダウン
    mysqladmin --user=mysql shutdown
    wait $pid  # バックグラウンドプロセスの終了を待機
fi

# 初期化済みの場合は、通常の起動方法でMySQLサーバを実行
exec mysqld
