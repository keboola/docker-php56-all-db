#VERSION 1.0.0
FROM keboola/base-php56
MAINTAINER Miro Cillik <miro@keboola.com>

# Install required tools
RUN yum install -y wget && yum install -y tar
RUN yum -y --enablerepo=epel,remi,remi-php56 install php-devel
RUN yum -y --enablerepo=epel,remi,remi-php56 install gcc
RUN yum -y --enablerepo=epel,remi,remi-php56 install make
RUN yum -y --enablerepo=epel,remi,remi-php56 install php-pear
RUN yum -y --enablerepo=epel,remi,remi-php56 install php-mysql
RUN yum -y --enablerepo=epel,remi,remi-php56 install php-mssql
RUN yum -y --enablerepo=epel,remi,remi-php56 install php-odbc

# Oracle
ADD oracle/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm /tmp/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
ADD oracle/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm /tmp/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
ADD oracle/oracle.sh /tmp/oracle.sh
RUN yum -y --nogpgcheck install /tmp/oracle-instantclient*
RUN export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib/
RUN export ORACLE_HOME=/usr/lib/oracle/12.1/client64/lib/
RUN echo 'instantclient,/usr/lib/oracle/12.1/client64/lib/' | pecl install -f oci8-1.4.10
RUN echo "extension=oci8.so" > /etc/php.d/30-oci8.ini

# MSSQL
ADD mssql/freetds.conf /etc/

# Cloudera
ADD cloudera/ClouderaImpalaODBC-2.5.30.1011-1.el6.x86_64.rpm /tmp/ClouderaImpalaODBC-2.5.30.1011-1.el6.x86_64.rpm
#RUN yum -y --nogpgcheck --skip-broken install /tmp/ClouderaImpalaODBC*




