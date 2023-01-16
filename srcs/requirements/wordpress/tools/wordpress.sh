if [ -f /var/www/html/wordpress/wp-config.php ]
then
    echo "Wordpress already installed"
else
    mkdir -p /var/www/html/wordpress
    curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/local/bin/wp 
    chmod +x /usr/local/bin/wp
    wp core download --path=/var/www/html/wordpress --allow-root
    chown -R www-data:www-data /var/www/*;
    chown -R 755 /var/www/*;
    sed -i "s/username_here/$WP_USER/g" /var/www/html/wordpress/wp-config-sample.php
	sed -i "s/password_here/$WP_PASSWORD/g" /var/www/html/wordpress/wp-config-sample.php
	sed -i "s/localhost/$WP_DATABASE_HOST/g" /var/www/html/wordpress/wp-config-sample.php
	sed -i "s/database_name_here/$WP_DATABASE/g" /var/www/html/wordpress/wp-config-sample.php
    mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
    wp core install --url=$WP_URL --title="$WP_TITLE" --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_USER_EMAIL --path=$WP_PATH --skip-email --allow-root
    wp user create $WP_USER_2 $WP_USER_2_MAIL --role=$WP_USER_2_ROLE --user_pass=$WP_USER_2_PASSWORD --path=$WP_PATH --allow-root
fi

exec "$@"
