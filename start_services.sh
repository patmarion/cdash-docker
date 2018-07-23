#!/bin/bash

trap "echo TRAPed signal" HUP INT QUIT KILL TERM

###
# Set up timezone
###
echo America/Los_Angeles > /etc/timezone && sudo dpkg-reconfigure --frontend noninteractive tzdata


if [ -z "$(ls /var/lib/mysql)" ]; then
    echo "running mysql_install_db because /var/lib/mysql is empty..."
    mysql_install_db
fi

/usr/sbin/apache2ctl start
/etc/init.d/mysql start

echo "[Hit ENTER key to exit] or run 'docker stop <container>'"

read

echo "Stopping."
