#!/bin/sh

#user1
username='test'
password='test'

adduser $username
echo -e "$username:$password" | chpasswd
mkdir -p /home/$username/ftps/files
chown nobody:nogroup /home/$username/ftps
chmod a-w /home/$username/ftps
chown $username /home/$username/ftps/files
echo $username >> /etc/vsftpd/vsftpd.userlist

supervisord -c /etc/supervisord.conf
