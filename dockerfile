FROM centos:latest
MAINTAINER gurudev59
RUN yum install httpd\
zip\
unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page276/jon.zip /var/www/html
WORKDIR /var/www/html
RUN unzip jon.zip
RUN cp -rvfjon/* .
RUN rm -rf jon.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
