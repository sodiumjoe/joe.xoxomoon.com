# DOCKER-VERSION 0.5.3

FROM ubuntu:latest

RUN apt-get update
RUN apt-get install python-software-properties python g++ make
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install nodejs

ADD . .

RUN npm install

EXPOSE 8080

RUN [docpad generate --env static]
CMD [docpad server]
