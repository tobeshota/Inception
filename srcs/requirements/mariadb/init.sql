-- DBの初期値データとして実行するSQL．
-- データベースの作成
CREATE DATABASE IF NOT EXISTS ${DB_NAME};

-- ユーザの追加
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}'; -- '%'は任意のIPアドレスから接続を許可する

-- ユーザーにデータベースへの権限を付与
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';

-- 権限の反映
FLUSH PRIVILEGES;
