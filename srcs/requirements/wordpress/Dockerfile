FROM debian:12

WORKDIR /var/www/wordpress

RUN apt update && apt install -y procps php8.2 php8.2-fpm php-mysql mariadb-client

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar ./

COPY www.conf /etc/php/8.2/fpm/pool.d/

COPY wp_init.sh ./

RUN chmod +x ./wp_init.sh

CMD ["./wp_init.sh"]

