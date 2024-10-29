#! /bin/sh
mysqld & 
sleep 10


if [ ! -d /var/lib/mysql/$DATA_BASE_NAME ]; then
    echo "Creating database..."
    mysql -e "CREATE DATABASE $DATA_BASE_NAME;"
    
    echo "Creating user..."
    mysql -e "CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_USER_PASSWORD';"
    
    echo "Granting privileges..."
    mysql -e "GRANT ALL ON $DATA_BASE_NAME.* TO '$MARIADB_USER'@'%' WITH GRANT OPTION;"
    
    echo "Flushing privileges..."
    mysql -e "FLUSH PRIVILEGES;"
fi

mysqladmin -u $MARIADB_ROOT_USER --password=$MARIADB_ROOT_PASSWORD shutdown
sleep 10
mysqld
