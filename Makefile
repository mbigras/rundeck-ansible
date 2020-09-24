VERSION := $(shell cat VERSION)

all: help
help:
	@cat README.md

build:
	docker build \
		--build-arg VERSION=$(VERSION) \
		--tag mbigras/rundeck-ansible:latest \
		.

release: build
	docker push mbigras/rundeck-ansible
