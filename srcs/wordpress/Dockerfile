FROM alpine:3.12.3

RUN apk update
RUN apk upgrade
RUN apk add supervisor
RUN apk add nginx
RUN apk add mysql-client
RUN apk add php7 php7-fpm php7-opcache php7-mysqli php7-mbstring php7-phar php7-json
RUN apk add curl
RUN apk add openssl

RUN mkdir -p /run/php7
RUN mkdir -p /run/nginx
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/supervisord.conf /etc/supervisord.conf

COPY ./srcs/ssl.sh .
RUN sh ssl.sh && rm -rf ssl.sh
COPY ./srcs/start.sh .
RUN chmod +x start.sh
VOLUME [ "/var/www/localhost/htdocs/" ]

EXPOSE 5050
CMD sh start.sh
