FROM mhart/alpine-node:5.12
MAINTAINER tech@musedlab.org

VOLUME /drone
RUN apk add --no-cache zip python make g++ git openssh
RUN mkdir -p /srv
RUN mkdir -p /srv/builddir
COPY ./package.json ./npm-shrinkwrap.json /srv/builddir/
WORKDIR /srv/builddir
RUN npm install
RUN rm package.json npm-shrinkwrap.json
