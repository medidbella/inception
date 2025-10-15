FROM debian:12

WORKDIR /var/www/wordpress

RUN apt update -y && apt install -y less curl procps \
	php8.2 php8.2-fpm php-mysql mariadb-client

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar ./

RUN chmod +x ./wp-cli.phar && mv ./wp-cli.phar /usr/bin/wp 

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/

WORKDIR /etc/scripts/

COPY ./tools/wp_init.sh ./

RUN chmod +x ./wp_init.sh

CMD ["./wp_init.sh"]
