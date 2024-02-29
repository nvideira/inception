FROM debian:oldstable-slim

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install mariadb-server -y

COPY ./tools/db-start.sh /home

RUN chmod 711 /home/db-start.sh

RUN mysql_install_db -y

EXPOSE 3306

ENTRYPOINT [ "/home/db-start.sh" ]