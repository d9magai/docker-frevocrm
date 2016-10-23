FROM centos
MAINTAINER d9magai

WORKDIR /var/www/html
RUN yum install -y epel-release \
    && rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
    && yum update -y \
    && yum install -y --enablerepo=remi-php56 \
       bsdtar \
       httpd \
       php \
       php-xml \
       php-pear-MDB2-Driver-mysqli \
    && yum clean all \
    && curl -sL https://f-revocrm.jp/frevowp/data/Frevo62.zip | bsdtar -xf- \
    && chown apache -R /var/www/html/

EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

