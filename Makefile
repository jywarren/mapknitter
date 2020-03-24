export COMPOSE_HTTP_TIMEOUT=360

define wait_for_container
	@while ! docker-compose logs web | grep "web server started"; do\
		echo "Serving Mapknitter";\
		sleep 10;\
	done;
endef

build:
	cp config/database.yml.example config/database.yml
	cp config/config.yml.example config/config.yml
	cp db/schema.rb.example db/schema.rb
	docker-compose build

deploy-container:
	docker-compose up -d
	$(call wait_for_container)

redeploy-container:
	docker-compose build --pull
	docker-compose down --remove-orphans
	docker-compose up --force-recreate -d
	docker-compose exec web yarn install
	docker-compose exec web bash -c "rake db:migrate && rake assets:precompile && rake tmp:cache:clear"
	$(call wait_for_container)
	docker-compose run -e "DISABLE_DATABASE_ENVIRONMENT_CHECK=1" --rm web bash -lc \
			      "bundle exec rails db:migrate"
