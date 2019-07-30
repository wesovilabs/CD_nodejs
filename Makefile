include .env

init:
	chmod +x .githooks/*
	git config core.hooksPath .githooks

lint:
	npm run fmt

lint:
	npm run lint

test:
	npm run test

build:
	docker build --build-arg NODE_VERSION=$(NODE_VERSION) -t=$(DOCKER_ID_USER)/cd_nodejs .

publsih:
	docker login;
	docker push $(DOCKER_ID_USER)/cd_nodejs

testIntegration:
	docker-compose -f scripts/docker-compose.yml build;
	docker-compose -f scripts/docker-compose.yml run --name testInt --rm test;

run:
	docker-compose -f scripts/docker-compose.yml build; \
	docker-compose -f scripts/docker-compose.yml run --name app --rm app

docker-%:
	docker-compose -f scripts/docker-compose.yml run --entrypoint "make $*" --name code --rm code
