FROM alpine:3.19

EXPOSE 3306

RUN apk update && \
    apk add --no-cache mariadb mariadb-client openrc \
    bash

RUN mkdir -p /run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY conf/mariadb.cnf /etc/my.cnf

CMD ["mysqld", "--user=mysql"]

