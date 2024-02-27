FROM debian:oldstable-slim

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y php-fpm php-mysql php-gd php-curl wget tar mariadb-client

RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x /usr/local/bin/wp

#RUN wget -q0- https://wordpress.org/latest.tar.gz | tar xvz -C /var/www/html --strip
COPY ./tools/wp-script.sh /home

COPY php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf

EXPOSE 9000

ENTRYPOINT [ "/home/wp-script.sh" ]

CMD [ "php-fpm", "--nodaemonize" ]