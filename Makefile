USER_NAME ?= lbnvd13
tag = logging

all: help

help:
	@echo " list для отображения списка всех образов"
	@echo " build-<имя_образа> для билда"
	@echo " build-all для билда всех образов"
	@echo " push-<имя_образа> для отправки в докер хаб"
	@echo " push-all для отправки всех образов"
	@echo " start собирает контейнеры и запускает проект локально"

list:
	@echo ui comment prometheus post

build-all: build-ui build-comment build-prometheus build-post
build-ui:
	@docker build -f src/ui/Dockerfile -t ${USER_NAME}/ui:${tag} src/ui
build-comment:
	@docker build -f src/comment/Dockerfile -t ${USER_NAME}/comment:${tag} src/comment
build-prometheus:
	@docker build -f monitoring/prometheus/Dockerfile -t ${USER_NAME}/prometheus monitoring/prometheus	
build-post:
	@docker build -f src/post-py/Dockerfile -t ${USER_NAME}/post:${tag} src/post-py

push-all: push-ui push-comment push-post push-prometheus
push-ui:
	docker push ${USER_NAME}/ui
push-post:
	docker push ${USER_NAME}/post
push-comment:
	docker push ${USER_NAME}/comment
push-prometheus:
	docker push ${USER_NAME}/prometheus

start:
	@docker-compose -f ./docker/docker-compose.yml  up -d
