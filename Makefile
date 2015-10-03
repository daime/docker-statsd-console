ORGANIZATION := daime
CONTAINER := docker-statsd-console

.PHONY: all build stop run

all: stop build run

build:
	-@docker build -t $(ORGANIZATION)/$(CONTAINER) .

stop:
	-@docker stop $(CONTAINER) > /dev/null

run:
	-@docker run --rm -p 8125:8125/udp -p 8126:8126 --name $(CONTAINER) $(ORGANIZATION)/$(CONTAINER)
