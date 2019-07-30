include .env

init:
	chmod +x .githooks/*
	git config core.hooksPath .githooks

lint:
	npm run lint

test:
	npm run test

testIntegration:
	docker-compose -f scripts/docker-compose.yml build;
	docker-compose -f scripts/docker-compose.yml run --name testInt --rm test;

run:
	docker-compose -f scripts/docker-compose.yml build; \
	docker-compose -f scripts/docker-compose.yml run --name app --rm app

docker-%:
	docker-compose -f scripts/docker-compose.yml run --entrypoint "make $*" --name code --rm code
