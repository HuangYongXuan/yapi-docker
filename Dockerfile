FROM node:10.14.2
MAINTAINER 754060604@qq.com

RUN mkdir /base && cd /base && git clone https://github.com/YMFE/yapi;
COPY config.json  /base
RUN apt-get update && apt-get -y install vim
RUN npm install -g yapi-cli
RUN cd /base/yapi && yarn install
WORKDIR /base/yapi

EXPOSE 3000
EXPOSE 9090

CMD ["yapi", "server"]