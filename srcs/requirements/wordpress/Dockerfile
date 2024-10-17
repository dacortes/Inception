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
    php81-mbstring

CMD ["php", "-v"]

