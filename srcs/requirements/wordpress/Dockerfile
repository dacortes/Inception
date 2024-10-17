FROM alpine:3.19

EXPOSE 9000

#test env
ENV DATA_BASE_NAME=my_database
ENV MARIADB_USER=my_user
ENV MARIADB_USER_PASSWORD=my_password
ENV DATA_BASE_HOSTNAME=localhost
ENV DOMAIN_NAME=mydomain.com
ENV WORDPRESS_TITLE="My WordPress Site"
ENV WORDPRESS_ADMIN_USER=admin
ENV WORDPRESS_ADMIN_PASSWORD=admin_password
ENV WORDPRESS_ADMIN_EMAIL=admin@mydomain.com
ENV WORDPRESS_USER=my_wordpress_user
ENV WORDPRESS_USER_EMAIL=my_wordpress_user@mydomain.com
ENV WORDPRESS_USER_PASSWORD=user_password


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
    php81-mbstring

# Descargar y configurar WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php/ && chmod 755 /run/php/

COPY conf/php-fpm.conf /etc/php81/php-fpm.d/php-fpm.conf

COPY --chmod=755 conf/wordpress.sh /usr/local/bin/wordpress.sh

WORKDIR /var/www/html/

ENTRYPOINT ["/usr/local/bin/wordpress.sh"]


