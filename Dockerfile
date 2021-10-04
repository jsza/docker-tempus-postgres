FROM postgres:12

COPY ./ip4r-master /ip4r-master

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -qy install make gcc postgresql-server-dev-12
RUN cd /ip4r-master && make install

RUN apt-get update && apt-get -qy remove make gcc postgresql-server-dev-12 && apt-get autoremove && apt-get clean
