#!/bin/bash
DB_NAME="wordpress_db"
DB_USER_NAME="wordpress_user"
DB_USER_PASS="tempPassword"
DOMAIN_NAME="midbella.42.fr"
SITE_TITLE="inception"
WP_ADMIN_USER="moderator"
WP_ADMIN_PASSWORD="JustASamplePass"
WP_ADMIN_EMAIL="test@test.tst"
WP_USER_EMAIL="test1@test.tst"
WP_USER_NAME="editor"
WP_USER_PASS="JustASampleUsrPass"

./wp-cli.phar core download --allow-root

until mariadb -h mariadb -u $DB_USER_NAME -p"$DB_USER_PASS" -e "SELECT 1"; do
    echo "waiting for database connection..."
    sleep 1
done

./wp-cli.phar config create \
	--dbname="$DB_NAME"\
	--dbuser="$DB_USER_NAME" \
	--dbpass="$DB_USER_PASS" \
	--dbhost="mariadb" \
	--allow-root

./wp-cli.phar core install \
	--url="$DOMAIN_NAME" \
	--title="$SITE_TITLE" \
	--admin_user="$WP_ADMIN_USER" \
	--admin_password="$WP_ADMIN_PASSWORD" \
	--admin_email="$WP_ADMIN_EMAIL" \
	--allow-root

./wp-cli.phar user create "$WP_USER_NAME" $WP_USER_EMAIL \
	--user_pass=$WP_USER_PASS
	--role="editor"
	--allow-root

exec php-fpm8.2 --nodaemonize