FROM centos:latest
MAINTAINER 754060604@qq.com
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN yum install -y gcc gcc-c++ git wget
RUN mkdir /download && cd /download && wget https://nodejs.org/dist/v10.14.1/node-v10.14.1.tar.gz
RUN cd /download && tar xvf ./node-v10.14.1.tar.gz && ls
RUN yum install -y make
RUN find / -type f -name which
RUN cd /download/node-v10.14.1 && ./configure && make && make install
RUN npm install -g yapi-cli
EXPOSE 9090 3000
COPY entrypoint.sh /usr/sbin
RUN chmod 777 /usr/sbin/entrypoint.sh
#CMD ["yapi", " server"]
#CMD ["/usr/sbin/init"]
ENTRYPOINT '/usr/sbin/entrypoint.sh'
#git pull && docker build -t ysll/yapi .
#ENTRYPOINT service tomcat7 start && tail -f /var/lib/tomcat7/logs/catalina.out