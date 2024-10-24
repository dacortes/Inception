FROM alpine:3.19

EXPOSE 9000

RUN apk update && \
    apk add --no-cache \
    curl \
    mariadb-client \
    php81 \
    php81-fpm \
    php81-mysqli \
    php81-json \
    php81-session \
    php81-xml \
    php81-ctype \
    php81-mbstring \
    php81-phar \
    bash

RUN ln -s /usr/bin/php81 /usr/bin/php

RUN addgroup -S www-wpsite && adduser -S www-wpsite -G www-wpsite

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php/ && chmod 755 /run/php/

COPY conf/php-fpm.conf /etc/php81/php-fpm.d/php-fpm.conf

COPY --chmod=755 conf/wordpress.sh /usr/local/bin/wordpress.sh

WORKDIR /var/www/html/

ENTRYPOINT ["/bin/bash", "/usr/local/bin/wordpress.sh"]
