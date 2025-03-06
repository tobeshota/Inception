# docker rm -f wordpress-container ; docker build -t wordpress .
# docker run -p 9000:9000 --name wordpress-container wordpress
FROM debian:12.8

# php-fpmをインストール
RUN apt update && apt install -y \
	php-fpm \
	php-mysqli \
	# For install wp-cli
	curl

COPY ./www.conf /tmp/
COPY ./wp-config.php /tmp/
COPY ./wordpress.sh /tmp/
RUN chmod +x /tmp/wordpress.sh

EXPOSE 9000

ENTRYPOINT [ "/tmp/wordpress.sh" ]
