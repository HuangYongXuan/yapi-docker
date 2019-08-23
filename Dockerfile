FROM centos:centos7
MAINTAINER 754060604@qq.com

COPY ./mongodb-org-4.2.repo /etc/yum.repos.d/
COPY config.json /usr/download
COPY entrypoint.sh /usr/download

RUN yum install -y wget git sudo \
    && curl -sL https://rpm.nodesource.com/setup_10.x | bash - && yum install -y nodejs && node -v \
    && yum update && yum install -y mongodb-org \
    && cd /usr/download/ && git clone https://github.com/YMFE/yapi.git \
    && cd /usr/download/yapi && npm i -g yarn && yarn \
    && /usr/bin/mongod -f /etc/mongod.conf && cd /usr/download/yapi/ && node server/install.js \
    && sudo chmod 777 /usr/download/entrypoint.sh &&  yum clean all

EXPOSE 27017
EXPOSE 3000

CMD /usr/download/entrypoint.sh
