# docker-statsd-console

All metrics are flushed to console in a flush interval.

This project has been built for development and testing purposes. It ensures an interface `8125/udp` to write metrics and an interface `8126/udp` to read metrics.

## Requirements

[Docker](https://docs.docker.com/installation/)

## Development

#### Clone the repo

```console
$ git clone git@github.com:daime/docker-statsd-console.git
$ cd docker-statsd-console
```

#### Build and run the container

```console
$ make
```

#### Write and read sample metrics

`DOCKER_HOST` has to be changed by the address where your docker host is running

__1. Write__

```console
$ echo "docker.statsd.console.rocks:1|c" | nc -u -w0 DOCKER_HOST 8125
```

__2. Read__

```console
$ echo "counters" | nc DOCKER_HOST 8126
```
