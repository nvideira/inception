FROM debian:oldstable-slim

RUN apt-get update -y && apt-get upgrade -y

# Install php-fpm and other php extensions and dependencies
RUN apt-get install -y php-fpm php-mysql php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip php-curl curl mariadb-client

# Install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

# Make wp-cli available globally
RUN mv wp-cli.phar /usr/local/bin/wp

# Create directory for php-fpm
RUN mkdir -p /run/php && chmod 755 /run/php

# Change the listen directive in the php-fpm pool configuration file
RUN sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 9000#g' /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/wp-script.sh /home/wp-script.sh

RUN chmod 755 /home/wp-script.sh

EXPOSE 9000

ENTRYPOINT /home/wp-script.sh

#CMD [ "php-fpm7.4", "-F" , "-R"]