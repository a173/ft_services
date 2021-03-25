FROM alpine:3.12.3

RUN apk update
RUN apk upgrade
RUN apk add supervisor
RUN apk add grafana --repository http://dl-2.alpinelinux.org/alpine/edge/community

COPY ./srcs/supervisord.conf /etc/supervisord.conf
COPY ./srcs/grafana.db /usr/share/grafana/data/grafana.db
VOLUME ["/usr/share/grafana"]

EXPOSE 3000
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
