FROM centos:latest
MAINTAINER gurudev59
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum -y update && yum clean all
RUN yum install httpd -y \
zip -y \
unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page276/jon.zip /var/www/html
WORKDIR /var/www/html
RUN unzip jon.zip
RUN cp -rvfjon/* .
RUN rm -rf jon.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
