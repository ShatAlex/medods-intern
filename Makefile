.SILENT:

run: 
	docker-compose up
init:
	docker-compose run medods-intern-app rails db:migrate