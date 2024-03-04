#!/bin/bash

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then

service mariadb start;

sleep 3;

echo "Creating database $DB_NAME"
mysql -u root -e "CREATE DATABASE $DB_NAME;"

echo "Creating user $DB_USR"
mysql -u root -e "CREATE USER '$DB_USR'@'%' IDENTIFIED BY '$DB_PASSWORD';"

echo "Applying privileges to $DB_USR"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USR'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

echo "Setting root password"
mysqladmin -u root password "$DB_PASSWORD"
mysqladmin -u root -p"$DB_PASSWORD" shutdown

fi

exec mysqld_safe --bind-address=0.0.0.0
