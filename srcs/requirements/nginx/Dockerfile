FROM debian:buster

RUN apt-get update && apt-get -y install nginx \
openssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/aessakhi.42.fr.crt -keyout /etc/ssl/aessakhi.42.fr.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=aessakhi/CN=aessakhi.42.fr"

COPY conf/nginx.conf /etc/nginx/conf.d

RUN chown -R www-data:www-data /var/www

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]