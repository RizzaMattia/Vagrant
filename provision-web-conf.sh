#!/bin/bash

#Aggiorno
apt-get update -y
apt-get upgrade -y

#Installo Apache
apt-get install apache2 -y

#Installo estensioni PHP
apt install php php-curl libapache2-mod-php php-cli php-mysql php-gd php-fpm -y

#Elimino l index di apache
rm /var/www/html/index.html

#Configuro apache in modo che legga anche il file index.php
sudo sed -i 's/DirectoryIndex .*/DirectoryIndex index.php index.html' /etc/apache2/mods-enabled/dir.conf

#Restarto il servizio apache2
systemctl restart apache2