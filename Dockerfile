FROM mhart/alpine-node

RUN apk add --update git

RUN git clone https://github.com/etsy/statsd.git /opt/statsd &&\
        cd /opt/statsd &&\
        git checkout v0.7.2

COPY ./config.js /opt/statsd/

EXPOSE 8125/udp
EXPOSE 8126

CMD ["/usr/bin/node", "/opt/statsd/stats.js", "/opt/statsd/config.js"]
