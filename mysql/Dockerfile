FROM ubuntu:14.04

MAINTAINER Seva Dolgopolov <zavalit@gmail.com> 

RUN apt-get update
RUN apt-get install -y mysql-server-5.5

# Remove pre-installed database
RUN rm -rf /var/lib/mysql/*

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

ADD startup.sh /

RUN chmod 755 /*.sh

EXPOSE 3306 

ENV VOLUME_HOME "/var/lib/mysql"
ENV DB_USER docker_user
ENV DB_PASSWORD 1234
ENV DB_NAME wordpress

VOLUME ["/var/lib/mysql", "/var/log/mysql"]

CMD ["/bin/bash", "/startup.sh"]
