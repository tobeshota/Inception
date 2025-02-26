-- DBの初期値データとして実行するSQL．
-- データベースの作成
CREATE DATABASE wordpress_db;

-- ユーザの追加
UREATE USER 'wordpress_user'@'%' IDENTIFIED BY 'password'; -- '%'は任意のIPアドレスから接続を許可する

-- ユーザーにデータベースへの権限を付与
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wordpress_user'@'%';

-- 権限の反映
FLUSH PRIVILEGES;
