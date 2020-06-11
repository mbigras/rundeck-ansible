VERSION := $(shell cat VERSION.txt)

all: help
help:
	@cat README.md

build:
	docker build --build-arg VERSION=$(VERSION) --tag mbigras/rundeck-ansible:latest .
	docker tag mbigras/rundeck-ansible:latest mbigras/rundeck-ansible:$(VERSION)

push:
	docker push mbigras/rundeck-ansible
