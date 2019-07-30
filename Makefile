NODE_VERSION=12-buster

deps:
	npm install

run:
	npm run start

fmt:
	npm run fmt

lint:
	npm run lint

test:
	npm run test

testInt:
	docker-compose -f scripts/docker-compose/docker-compose.yml build; \
	docker-compose -f scripts/docker-compose/docker-compose.yml run --name testInt --rm test


pipeline:
	docker build  -f scripts/ci/Dockerfile  --build-arg NODE_VERSION=12-buster -t nodejs_ci  .
