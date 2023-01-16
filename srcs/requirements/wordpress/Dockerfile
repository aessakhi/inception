FROM debian:buster

RUN apt-get update && apt-get -y install \
curl \
php \
php-cgi \
php-mysql \
php-fpm \
php-pdo \
php-gd php-cli \
php-mbstring

RUN mkdir /run/php

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY tools/wordpress.sh /tmp/wordpress.sh

RUN chmod +x /tmp/wordpress.sh

EXPOSE 9000

ENTRYPOINT [ "sh", "/tmp/wordpress.sh" ]

CMD ["php-fpm7.3", "-F"]