# DOCKER-VERSION 0.5.3

FROM joebadmo/dun

RUN apt-get install -y git

ADD . /src
RUN npm install -g docpad@6.49
RUN cd /src; npm install
RUN rm -rf /src/.git
RUN rm -rf /src/src/documents
RUN cd /src; docpad generate --env static

EXPOSE 9778
CMD cd /src; /src/node_modules/docpad/bin/docpad-server

