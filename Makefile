ORGANIZATION := daime
CONTAINER := docker-statsd-console

default: kill build run

build:
	docker build -t $(ORGANIZATION)/$(CONTAINER) .

kill:
	-@docker ps | grep $(ORGANIZATION)/$(CONTAINER) | awk '{ print $$1 }' | xargs docker kill > /dev/null
	-@docker ps -a | grep $(ORGANIZATION)/$(CONTAINER) | awk '{ print $$1 }' | xargs docker rm > /dev/null

run:
	docker run -p 8125:8125/udp -p 8126:8126 --name $(CONTAINER) $(ORGANIZATION)/$(CONTAINER)
