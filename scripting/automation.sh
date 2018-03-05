#!/bin/bash
rpm --import /etc/pki/rpm-gpg/RMP-GPG-KEY*

yum -y install epel-release

yum -y install mariadb-server mariadb

system ctl enable mariadb.service

mysql_secure_installation

yum -y install httpd

systemctl start httpd

systemctl enable httpd

firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --permanent --zone=public --add-service=https
firewall-cmd --reload

yum -y install php

systemctl restart httpd.service

touch /var/www/html/info.php
echo "<?php" >> /var/www/html/info.php
echo "phpinfo();" >> /var/www/html/info.php
echo "?>" >> /var/www/html/info.php

yum seach php
yum -y install php-mysql
yum -y install php-gd php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-snmp php-soap curl curl-devel

systemctl restart httpd.service
yum install phpMyAdmin
systemctl restart httpd.service
