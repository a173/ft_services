FROM alpine:3.12.3

RUN apk update
RUN apk upgrade
RUN apk add supervisor
RUN apk add influxdb
RUN apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community

RUN mkdir -p /run/influxdb
RUN mkdir -p /etc/telegraf/
COPY ./srcs/supervisord.conf /etc/supervisord.conf
RUN telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf
VOLUME ["/var/lib/influxdb"]

EXPOSE 8086
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
