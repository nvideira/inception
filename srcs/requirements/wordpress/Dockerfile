FROM debian:oldstable-slim

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y php-fpm php-mysql php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip php-curl curl mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php && chmod 755 /run/php
#RUN mv wp-cli.phar /usr/local/bin/wp

RUN sed -i 's#listen = /run/php/php7\.3-fpm\.sock#listen = 9000#g' /etc/php/7.*/fpm/pool.d/www.conf
#RUN wget -q0- https://wordpress.org/latest.tar.gz | tar xvz -C /var/www/html --strip
COPY ./tools/wp-script.sh /home

RUN chmod 755 /home/wp-script.sh
#COPY php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf

EXPOSE 9000

ENTRYPOINT [ "/home/wp-script.sh" ]

CMD [ "php-fpm", "--nodaemonize" ]