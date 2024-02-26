FROM debian:oldstable-slim

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y php-fpm php-mysql php-gd php-curl wget tar

RUN wget -q0- https://wordpress.org/latest.tar.gz | tar xvz -C /var/www/html --strip

COPY php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf

EXPOSE 9000

CMD [ "php-fpm", "--nodaemonize" ]