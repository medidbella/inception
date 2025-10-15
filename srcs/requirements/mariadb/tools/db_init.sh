#!/bin/bash

mariadb-install-db > /dev/null

chown -R mysql:mysql /var/lib/mysql

service mariadb start

until mariadb -e "SELECT 1" > /dev/null; do
    echo "waiting for mariaDB to start..."
    sleep 1
done

mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME"

echo "created a database"

mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER_NAME@'%' IDENTIFIED BY \"$DB_USER_PASS\";"

echo "created a user that has access to the database"

mysqladmin shutdown > /dev/null

exec mariadbd-safe
