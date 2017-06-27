#!/bin/bash

/etc/init.d/mysql start && gunzip < /root/default_cdash_database.sql.gz | mysql -u root cdash
