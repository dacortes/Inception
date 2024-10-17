FROM alpine:3.19

RUN apk update && \
    apk add --no-cache mariadb mariadb-client openrc

RUN mkdir -p /run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY conf/mariadb.cnf /etc/my.cnf

EXPOSE 3306

CMD ["mysqld", "--user=mysql"]

