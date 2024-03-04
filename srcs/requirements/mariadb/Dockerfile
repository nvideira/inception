FROM debian:oldstable-slim

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install mariadb-server

RUN mysql_install_db

COPY ./tools/db-start.sh /home/db-start.sh

RUN chmod 755 /home/db-start.sh

EXPOSE 3306

ENTRYPOINT [ "/home/db-start.sh" ]