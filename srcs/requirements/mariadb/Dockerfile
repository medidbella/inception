FROM debian:12

RUN apt -y update && apt -y install mariadb-server

COPY ./port.cnf /etc/mysql/conf.d/

COPY db_init.sh /etc/

RUN chmod +x /etc/db_init.sh

ENTRYPOINT ["./etc/db_init.sh"]