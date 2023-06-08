.DEFAULT_GOAL := help

#help: @ List available tasks on this project
help:
	@clear
	@echo "Usage: make COMMAND"
	@echo
	@echo "Commands :"
	@echo
	@grep -E '[a-zA-Z\.\-]+:.*?@ .*$$' $(MAKEFILE_LIST)| tr -d '#' | awk 'BEGIN {FS = ":.*?@ "}; {printf "\033[32m%-9s\033[0m - %s\n", $$1, $$2}'

#build: @ Build project
build:
	@mvn clean package install -Dmaven.test.skip=true

#test: @ Run project tests
test: build
	@mvn test

#sonar: @ Run Sonar test
sonar:
	@mvn verify sonar:sonar -DskipTests