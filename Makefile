ORGANIZATION := daime
CONTAINER := docker-statsd-console

default: stop build run

build:
	-@docker build -t $(ORGANIZATION)/$(CONTAINER) .

stop:
	-@docker stop $(CONTAINER) > /dev/null
	-@docker rm $(CONTAINER) > /dev/null

run:
	docker run -p 8125:8125/udp -p 8126:8126 --name $(CONTAINER) $(ORGANIZATION)/$(CONTAINER)
