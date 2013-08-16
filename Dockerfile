DOCKER-VERSION 0.5.3

FROM cmfatih/dun

RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:fkrull/deadsnakes
RUN apt-get update
RUN apt-get -y install python2.7 curl make patch gcc g++
ENV PYTHON python2.7

ADD . /src
RUN npm install -g docpad@6.49
RUN cd /src; npm install
RUN cd /src; docpad generate --env static

EXPOSE 9778
CMD cd /src; /src/node_modules/docpad/bin/docpad-server
