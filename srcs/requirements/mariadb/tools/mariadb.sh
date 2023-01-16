if [ ! -d "var/lib/mysql/wordpress" ] 
then
	mysql_install_db
	/etc/init.d/mysql start
	echo "UPDATE mysql.user SET Password=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User='root';" | mysql -uroot
	echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot
	echo "DELETE FROM mysql.user WHERE User='';" | mysql -uroot
	echo "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%'" | mysql -uroot
	echo "DROP DATABASE test;" | mysql -uroot
	echo "CREATE USER IF NOT EXISTS '$WP_USER'@'%' IDENTIFIED BY '$WP_PASSWORD';" | mysql -uroot
	echo "CREATE DATABASE IF NOT EXISTS $WP_DATABASE; GRANT ALL ON $WP_DATABASE.* TO '$WP_USER'@'%' IDENTIFIED BY '$WP_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot
	echo "UPDATE mysql.user SET plugin='' WHERE user ='root';" | mysql -uroot
	sleep 5
	/etc/init.d/mysql stop
fi

exec "$@"
