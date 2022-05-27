exec:
	docker exec -it go-heroku sh
up:
	docker-compose -f dockers/docker-compose.yml build && docker-compose -f dockers/docker-compose.yml up
down:
	docker-compose -f dockers/docker-compose.yml down
logs:
	docker-compose -f dockers/docker-compose.yml logs -f app

.PHONY: exec up down logs
