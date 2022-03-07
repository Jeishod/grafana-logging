#Makefile
up:
	docker-compose up

down:
	docker-compose down

build:
	docker-compose build

rebuild:
	docker-compose up -d --build

logs:
	docker-compose logs -f
