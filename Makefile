
start: install dev

install:
	npm install

dev:
	npm run dev

dist: install
	npm run build

clean:
	npm prune
	npm run clean
