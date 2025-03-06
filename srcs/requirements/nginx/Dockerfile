## Dockerfileのビルドとコンテナの起動方法
# docker build -t nginx .
# docker run -it --rm -p 443:443 nginx
## 軌道の確認方法
# <ブラウザの場合> "https://localhost:443"を開く
# <curlコマンドの場合>  curl -k https://localhost:443
FROM debian:12.8

RUN apt update && apt install -y \
	nginx \
	# For For SSL/TLS encryption
	openssl

# SSL自己署名書の生成
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/nginx.key \
	-out /etc/nginx/ssl/nginx.crt \
	-subj "/C=JP/ST=Tokyo/L=Tokyo/O=42Tokyo/OU=42Tokyo/N=toshota.42.fr"

COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

# dockerではコマンドをforegroundで動かさないとコンテナが停止してしまいます。nginxはデフォルトはデーモンとして動くので、foregroundで動くように設定しましょう。
# https://heartbeats.jp/hbblog/2014/07/3-tips-for-nginx-on-docker.html
CMD ["nginx", "-g", "daemon off;"]
