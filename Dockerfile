#VERSION 1.0.0
FROM keboola/base-php56
MAINTAINER Miro Cillik <miro@keboola.com>

# Install required tools
RUN yum install -y wget && yum install -y tar
RUN yum -y --enablerepo=epel,remi,remi-php56 install php-devel
RUN yum -y --enablerepo=epel,remi,remi-php56 install gcc
RUN yum -y --enablerepo=epel,remi,remi-php56 install make


# Oracle

ADD oracle/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm /tmp/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
ADD oracle/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm /tmp/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
ADD oracle/oracle.sh /tmp/oracle.sh

#RUN yum -y --nogpgcheck install /tmp/oracle-instantclient*
#RUN /tmp/oracle.sh


#RUN echo 'instantclient,/usr/local/instantclient' | pecl install oci8
#RUN echo "extension=oci8.so" > /etc/php5/apache2/conf.d/30-oci8.ini


#RUN yum -y install php-pear
#RUN pear install oci8



