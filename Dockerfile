DOCKER-VERSION 0.5.3

FROM joebadmo/dun

ADD . /src
RUN npm install -g docpad@6.49
RUN cd /src; npm install
RUN cd /src; docpad generate --env static

EXPOSE 9778
CMD cd /src; /src/node_modules/docpad/bin/docpad-server

