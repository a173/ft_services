FROM alpine:3.12.3

RUN apk update
RUN apk upgrade
RUN apk add supervisor
RUN apk add nginx
RUN apk add openssl

RUN mkdir -p /run/nginx
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/supervisord.conf /etc/supervisord.conf
COPY ./srcs/ssl.sh .
RUN sh ssl.sh && rm -rf ssl.sh
COPY ./srcs/html/ /var/lib/nginx/html/

EXPOSE 80 443 22
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
