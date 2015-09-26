FROM ubuntu:14.04

RUN apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get -y update
RUN apt-get -y install nodejs git

RUN git clone https://github.com/etsy/statsd.git /opt/statsd &&\
        cd /opt/statsd &&\
        git checkout v0.7.2

COPY ./config.js /opt/statsd/

EXPOSE 8125/udp
EXPOSE 8126

CMD ["/usr/bin/node", "/opt/statsd/stats.js", "/opt/statsd/config.js"]
