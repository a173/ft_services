#!/bin/sh

rc update
rc default
mysql_install_db
rc-service mariadb setup
rc-service mariadb start
mysql -uroot <<MYSQL_SCRIPT
CREATE DATABASE wp;
CREATE USER 'root'@'%' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON *.* TO 'root';
MYSQL_SCRIPT
rc-service mariadb stop
supervisord -c /etc/supervisord.conf
