FROM alpine:3.19

RUN apk update && \
    apk add --no-cache mariadb mariadb-client openrc \
    bash

RUN mkdir -p /run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY conf/mariadb.cnf /etc/my.cnf

COPY conf/mariadb.sh /usr/local/bin/mariadb.sh

RUN chmod 775 /etc/my.cnf
RUN chmod 755 /usr/local/bin/mariadb.sh

CMD [""]
ENTRYPOINT ["/usr/local/bin/mariadb.sh"]
