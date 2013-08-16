# DOCKER-VERSION 0.5.3

FROM cmfatih/dun

ADD . /src
RUN npm install -g npm
RUN npm install -g docpad@6.49
RUN cd /src; npm install

EXPOSE 9778
RUN docpad generate --env static
CMD cd /src; /src/node_modules/docpad/bin/docpad-server
