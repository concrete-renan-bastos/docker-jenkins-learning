FROM debian:jessie

MAINTAINER Renan Bastos renan.bastos@concrete.com.br

RUN apt-get update && apt-get install -y apache2 wget && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

WORKDIR /var/www/html

RUN rm -f index.html && wget https://raw.githubusercontent.com/concrete-renan-bastos/docker-jenkins-learning/master/index.html
EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
