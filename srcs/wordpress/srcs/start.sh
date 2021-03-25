#!/bin/sh

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
cd /var/www/localhost/htdocs
wp core download --locale=ru_RU
wp core config --dbname=wp --dbuser=root --dbpass= --dbhost=mysql-svc --dbprefix=wp_
wp core install --url="https://192.168.99.101:5050"  --title="Это твой WP" --admin_user="admin" --admin_password="admin" --admin_email="admin@email.ru"
wp user create user1 user1@email.ru --user_pass=1234567890
wp user create user2 user2@email.ru --user_pass=1234567890
supervisord -c /etc/supervisord.conf