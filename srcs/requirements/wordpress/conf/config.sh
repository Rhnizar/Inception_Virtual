#!/bin/sh

if [ ! -d "/var/www/html/wordpress" ]
then
    mkdir /var/www/html/wordpress 
fi
 
cd /var/www/html/wordpress && rm -rf *
 
# Download WordPress
echo "Downloading WordPress ..."
wp core download --allow-root

# this config for establishing a database connection ???
sed -i "s/username_here/${DB_USER}/g" wp-config-sample.php
sed -i "s/password_here/${USER_PASS}/g" wp-config-sample.php
sed -i "s/localhost/${MYSQL_DATABASE}/g" wp-config-sample.php
sed -i "s/database_name_here/${DB_NAME}/g" wp-config-sample.php
cp  wp-config-sample.php wp-config.php

# Install WordPress
echo "Installing WordPress ..."
wp core install --allow-root --url=${DOMAINE_NAME} --title=${TITLE} --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASS} --admin_email=${ADMIN_EMAIL}
echo "Creating users..."
wp user create rhnizar rhnizar@gmail.com --role=administrator --user_pass=0000 --path=/var/www/html/wordpress --allow-root

exec php-fpm7 -F
