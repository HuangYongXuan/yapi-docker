FROM centos:centos7
MAINTAINER 754060604@qq.com

COPY mongodb-org-4.2.repo \
    config.json \
    entrypoint.sh \
    /usr/

RUN cp /usr/mongodb-org-4.2.repo /etc/yum.repos.d/ && yum install -y wget git sudo \
    && curl -sL https://rpm.nodesource.com/setup_10.x | bash - && yum install -y nodejs \
    && yum update -y && yum install -y mongodb-org \
    && cd /usr/ && git clone https://github.com/YMFE/yapi.git \
    && cd /usr/yapi && npm i -g yarn && yarn install --production \
    && /usr/bin/mongod -f /etc/mongod.conf && cd /usr/yapi/ && node server/install.js \
    && sudo chmod 777 /usr/entrypoint.sh &&  yum clean all && yarn cache clean && npm cache clean -f \
    && yum remove -y wget git sudo

EXPOSE 27017
EXPOSE 3000

CMD /usr/entrypoint.sh
