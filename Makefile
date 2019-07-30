include .env

init:
	chmod +x .githooks/*
	git config core.hooksPath .githooks

lint:
	npm run lint

test:
	npm run test

run:
	docker-compose -f scripts/docker-compose.yml build; \
	docker-compose -f scripts/docker-compose.yml run --name app --rm app

testIntegration:
	docker-compose -f scripts/docker-compose.yml build;
	docker-compose -f scripts/docker-compose.yml run --name testInt --rm test;

