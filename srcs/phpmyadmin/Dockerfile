FROM alpine:3.12.3

RUN apk update
RUN apk upgrade
RUN apk add supervisor
RUN apk add nginx
RUN apk add php7 php7-fpm php7-opcache php7-mysqli php7-mbstring php7-iconv php7-json php7-xml
RUN apk add phpmyadmin
RUN apk add openssl

RUN mkdir -p /run/nginx
RUN mkdir -p /etc/phpmyadmin/tmp/
RUN chmod 777 /etc/phpmyadmin/tmp/
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/supervisord.conf /etc/supervisord.conf

COPY ./srcs/config.inc.php /etc/phpmyadmin
COPY ./srcs/ssl.sh .
RUN sh ssl.sh && rm -rf ssl.sh
VOLUME [ "/usr/share/webapps/phpmyadmin/" ]

EXPOSE 5000
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
