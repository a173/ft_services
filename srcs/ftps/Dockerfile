FROM alpine:3.12.3

RUN apk update
RUN apk upgrade
RUN apk add openssl vsftpd
RUN apk add supervisor

COPY ./srcs/start.sh .
RUN chmod +x start.sh
COPY ./srcs/supervisord.conf /etc/supervisord.conf
COPY ./srcs/vsftpd.conf .
RUN cat vsftpd.conf > /etc/vsftpd/vsftpd.conf
RUN rm -f vsftpd.conf

COPY ./srcs/ssl.sh .
RUN sh ssl.sh && rm -rf ssl.sh
VOLUME ["/home"]

EXPOSE 21 2100
CMD sh start.sh