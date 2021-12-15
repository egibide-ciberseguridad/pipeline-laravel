help:
	@echo Opciones:
	@echo -------------------
	@echo start / stop / restart
	@echo build
	@echo logs
	@echo workspace
	@echo seed
	@echo stats
	@echo clean
	@echo -------------------

_start-command:
	@docker-compose up -d --remove-orphans

start: _start-command _urls

stop:
	@docker-compose stop

restart: stop start

build:
	@docker-compose build

logs:
	@docker-compose logs app

workspace:
	@docker-compose exec app /bin/bash

seed:
	@docker-compose exec app php artisan migrate:fresh --seed

stats:
	@docker stats

clean:
	@docker-compose down -v --remove-orphans

_urls:
	${info }
	@echo -------------------
	@echo [laravel-blog] http://localhost:8000
	@echo -------------------
