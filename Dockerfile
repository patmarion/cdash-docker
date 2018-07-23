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

WORKDIR /var/www

RUN git clone https://github.com/Kitware/CDash.git CDash
RUN cd CDash && git checkout prebuilt
RUN ln -s /var/www/CDash/public /var/www/html/cdash
RUN chown -R www-data:www-data /var/www/CDash
RUN rm /var/www/html/index.html

WORKDIR /root

###
# Copy over some files we'll use.
###

COPY mysql_export.sh /root/
COPY mysql_import.sh /root/
COPY start_services.sh /root/

####
# Startup stuff.
####

EXPOSE 80

CMD /root/start_services.sh
