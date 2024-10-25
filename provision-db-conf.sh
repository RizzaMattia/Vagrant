#!/bin/bash

#Aggiorno
apt-get update -y
apt-get upgrade -y

#Installo MySql
apt-get install mysql-server -y 

#Permetto la connessione remota
sed -i.bak 's/bind-address.*$/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

#Restarto il servizio mysql
systemctl restart mysql