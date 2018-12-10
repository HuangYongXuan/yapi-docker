FROM centos:latest
MAINTAINER 754060604@qq.com
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN yum install -y gcc gcc-c++ git wget
RUN mkdir /download && cd /download && wget https://nodejs.org/dist/v10.14.1/node-v10.14.1.tar.gz
RUN tar xvf /download/node-v10.14.1.tar.gz && cd /download/node-v10.14.1 && ./configure && make && make install

CMD ["/usr/sbin/init"]