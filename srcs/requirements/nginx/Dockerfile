# docker build -t nginx .
# docker run -it --rm -p 80:80 nginx
FROM debian:stable

RUN apt update && apt install -y nginx

# CMD ["bash"]

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
