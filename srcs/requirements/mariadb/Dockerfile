FROM debian:buster

RUN apt-get update && apt-get -y install mariadb-server mariadb-client

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

COPY conf/50-server.cnf /etc/mysql/my.cnf

COPY tools/mariadb.sh /tmp/mariadb.sh

RUN chmod +x /tmp/mariadb.sh

EXPOSE 3306

ENTRYPOINT [ "sh", "/tmp/mariadb.sh" ]

CMD ["mysqld"]