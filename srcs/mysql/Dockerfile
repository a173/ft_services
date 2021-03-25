FROM alpine:3.12.3

RUN apk update
RUN apk upgrade
RUN apk add openrc
RUN apk add supervisor
RUN apk add mysql mysql-client

COPY ./srcs/start.sh .
RUN chmod +x start.sh
COPY ./srcs/my.cnf /etc/mysql
COPY ./srcs/supervisord.conf /etc/supervisord.conf
VOLUME ["/var/lib/mysql"]

EXPOSE 3306
CMD sh start.sh
