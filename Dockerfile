FROM node:10.14.2
MAINTAINER 754060604@qq.com

RUN mkdir /base && cd /base && git clone https://github.com/YMFE/yapi;
COPY config.json  /base
RUN cd /base/yapi && npm i

CMD ["/usr/sbin/init"]