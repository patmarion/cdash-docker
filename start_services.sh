#!/bin/bash

trap "echo TRAPed signal" HUP INT QUIT KILL TERM

###
# Set up timezone
###
echo America/Los_Angeles > /etc/timezone && sudo dpkg-reconfigure --frontend noninteractive tzdata
#ln -fs /usr/share/zoneinfo/US/Eastern /etc/localtime && dpkg-reconfigure -f noninteractive tzdata


if [ -z "$(ls /var/lib/mysql)" ]; then
  echo "running mysqld --initialize"
  ./rebuild_mysql_db.sh
fi

/usr/sbin/apache2ctl start
/etc/init.d/mysql start

echo "[Hit ENTER key to exit] or run 'docker stop <container>'"

read

echo "Stopping."
