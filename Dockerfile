#####
# Dockerfile for creating a
# CDash dashboard instance.
#####

FROM ubuntu:14.04
USER root
ENV HOME /root
WORKDIR /root

###
# Set up environmental variables
###

ENV DEBIAN_FRONTEND noninteractive

###
# Install some packages.
###

RUN apt-get update && apt-get install -y -qq apache2 mysql-server php5 php5-mysql php5-xsl php5-curl php5-gd unzip git htop nano sudo

###
# Check out CDash from github,
# perform necessary setup.
###

WORKDIR /var/www/html
RUN git clone https://github.com/Kitware/CDash.git CDash
RUN cd CDash && git checkout Release-2-2-2 && mkdir -p /var/www/html/CDash/rss
RUN chmod -R 777 /var/www/html/CDash && mv /var/www/html/CDash/* /var/www/html/ && rm /var/www/html/index.html

WORKDIR /root

###
# Copy over some files we'll use.
###

# COPY default_cdash_database.sql.gz /root/
COPY mysql_export.sh /root/
COPY mysql_import.sh /root/
COPY start_services.sh /root/
COPY rebuild_mysql_db.sh /root/

####
# Startup stuff.
####

EXPOSE 80

CMD /root/start_services.sh
