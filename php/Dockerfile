FROM ubuntu:14.04

MAINTAINER Seva Dolgopolov <zavalit@gmail.com>

RUN apt-get update
RUN apt-get -yqq install php5-fpm php5-mysql
RUN apt-get -yqq install mysql-client-5.5 
RUN mkdir -p /var/www/app
ADD www.conf /etc/php5/fpm/pool.d/


VOLUME ["/var/www/app", "/var/run/"]

ENTRYPOINT ["php5-fpm", "-F"]
