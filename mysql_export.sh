#!/bin/bash
set -x

/etc/init.d/mysql start
mysqldump -u root --databases cdash | gzip > /root/local_files/cdash_database.sql.gz
echo Finished.
