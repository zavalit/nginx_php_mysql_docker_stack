FROM ubuntu:14.04

MAINTAINER Seva Dolgopolov <zavalit@gmail.com>

RUN apt-get update
RUN apt-get install -y nginx

ADD app.conf /etc/nginx/sites-available/
RUN rm /etc/nginx/sites-enabled/default &&  ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
