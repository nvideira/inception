#! /bin/sh

sleep 5

if [ ! -f "/var/www/html/wp-config.php" ]; then
    if cd /var/www/html && wp core download --allow-root; then
        wp config create --allow-root --path=/var/www/html/ --dbname=$DB_NAME --dbuser=$DBUSR --dbpass=$DB_PASSWORD --dbhost=$DB_HOST \
            && \
        wp core install --allow-root --title=$WP_SITE_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL --url=$WP_URL \
            && \
        wp user create --allow-root $WP_USR $WP_MAIL --user_pass=$WP_USR_PASS
    fi
fi

exec "$@"