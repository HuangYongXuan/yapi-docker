FROM centos:centos7
MAINTAINER 754060604@qq.com

RUN yum install -y wget git sudo
RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash - && yum install -y nodejs && node -v

COPY ./mongodb-org-4.2.repo /etc/yum.repos.d/
RUN yum update && yum install -y mongodb-org && sudo systemctl enable mongod.service

RUN mkdir -p /usr/download/ && cd /usr/download/ && git clone https://github.com/YMFE/yapi.git
COPY config.json /usr/download

RUN cd /usr/download/yapi && npm i -g yarn && yarn
RUN /usr/bin/mongod -f /etc/mongod.conf && cd /usr/download/yapi/ && node server/install.js

EXPOSE 27017
EXPOSE 3000

COPY entrypoint.sh /usr/download
RUN sudo chmod 777 /usr/download/entrypoint.sh
CMD /usr/download/entrypoint.sh
