
start: install dev

docker:
	docker-compose run --rm app npm install
	docker-compose run --rm --service-ports app

install:
	npm install

dev:
	npm run dev

dist: install
	npm run build

clean:
	npm prune
	npm run clean
