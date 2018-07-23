#!/bin/bash

if [ -z "$(ls /var/lib/mysql)" ]; then
    echo "running mysql_install_db because /var/lib/mysql is empty..."
    mysql_install_db
fi

/etc/init.d/mysql start
gunzip < /root/local_files/cdash_database.sql.gz | mysql -u root
