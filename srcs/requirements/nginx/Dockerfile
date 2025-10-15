FROM debian:12

WORKDIR /etc/nginx/

RUN apt update -y && apt -y install openssl nginx 

RUN mkdir -p /etc/srv-prv/ /etc/nginx/

COPY ./conf/nginx.conf ./

RUN openssl req -x509 -nodes \
			-keyout /etc/srv-prv/nginx_ssl.key \
			-out /etc/srv-prv/nginx_ssl.crt \
			-days 365\
			-subj "/C=MA/ST=NON/L=NON/O=1337/OU=IT/CN=midbella.42.fr/UID=INV"

CMD ["nginx"]
