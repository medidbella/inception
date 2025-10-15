FROM debian:12

RUN apt -y update && apt -y install mariadb-server

COPY ./tools/db_init.sh /etc/

RUN echo "[mysqld]\nbind-address = 0.0.0.0\nport = 3306" >> /etc/mysql/my.cnf

RUN chmod +x /etc/db_init.sh

ENTRYPOINT ["./etc/db_init.sh"]