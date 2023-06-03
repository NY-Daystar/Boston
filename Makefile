APP_NAME=boston
APP_VERSION=1.0.0

.PHONY: install run test

all:
	@echo "\e[33m# Install dependencies\e[0m"
	make install-dependencies

	@echo "\e[33m# Launch unit tests\e[0m"
	@sleep 2
	make test 

	@echo "\e[33m# Running ${APP_NAME} application\e[0m"
	@sleep 3
	make run

install-dependencies:
	bundle install 
run:
	ruby ${APP_NAME}.rb
test:
	rspec tests/*.rb
	
# list all target in makefile
list:
	@grep '^[^#[:space:]].*:' Makefile | grep -v '\.PHONY'