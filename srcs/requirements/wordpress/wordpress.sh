#!/bin/bash

# ただタイミングの問題では？mariadb起動後にこのスクリプトを実行すれば良いのでは？
# mariadbの起動を待機
sleep 10



# wordpressは/var/www/html配下にインストールされるため、ディレクトリを作成する必要がある
wd=/var/www/html
mkdir -p $wd
cd $wd
rm -rf *

## wp-cliのインストール
# https://wp-cli.org/ja/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# WP-CLIをwpコマンドで実行するためには，wp-cli.pharが実行可能で，かつ，環境変数PATHに登録された場所に置かれていることが必要であるため
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

## www.confの更新
mv /tmp/www.conf /etc/php/8.2/fpm/pool.d/www.conf

## wordpressの初期化設定（WordPressファイルが存在しない場合のみ実行）
if [ ! -f wp-load.php ]; then
	# wordpressのダウンロード
	wp core download --allow-root
	## wp-config.phpの更新
	mv /tmp/wp-config.php $wd/wp-config.php
	rm -f $wd/wp-config-sample.php	# wp core download --allow-root 実行後存在する
	# wordpressのインストール
	# wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --allow-root --path=$wd	# wp-config.phpで設定されるため不要


	# ここまでにmariadbが起動していなければならない．
	wp core install --url=$WP_URL/ --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root --path=$wd
	# ユーザーが存在しない場合にのみ、ユーザー作成
	if ! wp user get $WP_USER --allow-root > /dev/null 2>&1; then
		wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASS --allow-root --path=$wd
	fi

	# wp theme install astra --activate --allow-root
	# wp plugin update --all --allow-root
else
	echo "WordPress files already exist. Skipping download and installation."
fi


## PHP-FPMの設定
# PHP-FPMがPHP-FPMソケットファイルなどのランタイムファイルを保存するために必要なディレクトリ（/run/php）を作成する．
# mkdir /run/php
# PHP-FPMを-F（フォアグラウンド）で起動する（コンテナが終了しない様にするため）
exec php-fpm8.2 -F
