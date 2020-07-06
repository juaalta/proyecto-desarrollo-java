# File idea obtained from: https://gist.github.com/mpneuried/0594963ad38e68917ef189b4e6a269db

# Import deploy config
# You can change the default deploy config with `make cnf="deploy_special.env" release`
dpl ?= deploy.env
include $(dpl)
export $(shell sed 's/=.*//' $(dpl))

# Import application config.
# You can change the default application config with `make cnf="config_special.env" build`
cnf ?= config.env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

# Get the App variables from the pom.xml file
VERSION=$(shell ./scripts/version.sh)
APP_NAME=$(shell ./scripts/app_name.sh)


# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# DOCKER TASKS
# Build the container
build: ## Build the container
	docker build -f ./docker/Dockerfile --force-rm --tag $(DOCKER_REPO)/$(APP_NAME) .

build-nc: ## Build the container without caching
	docker build -f ./docker/Dockerfile --no-cache --force-rm --tag $(DOCKER_REPO)/$(APP_NAME) .

test: ## Test the container
	docker build -f ./docker/Dockerfile --no-cache --target test --force-rm --tag $(DOCKER_REPO)/$(APP_NAME) .

run: ## Run container on port configured in `config.env`
	docker run -i -t --rm --env-file=./config.env -p=$(PORT):$(PORT) --name="$(APP_NAME)" $(DOCKER_REPO)/$(APP_NAME)

up: build run ## Run container on port configured in `config.env` (Alias to run)

stop: ## Stop and remove a running container
	docker stop $(APP_NAME); docker rm $(APP_NAME)

release: build-nc publish ## Make a release by building and publishing the `{version}` and `latest` tagged containers to Docker Repository


# Docker publish
publish: repo-login publish-latest publish-version ## Publish the `{version}` and `latest` tagged containers to Docker Repository

publish-latest: tag-latest ## Publish the `latest` taged container to Docker Repository
	@echo 'publish latest to $(DOCKER_REPO)'
	docker push $(DOCKER_REPO)/$(APP_NAME):latest

publish-version: tag-version ## Publish the `{version}` taged container to Docker Repository
	@echo 'publish $(VERSION) to $(DOCKER_REPO)'
	docker push $(DOCKER_REPO)/$(APP_NAME):$(VERSION)


# Docker tagging
tag: tag-latest tag-version ## Generate container tags for the `{version}` and `latest` tags

tag-latest: ## Generate container `latest` tag
	@echo 'create tag latest'
	docker tag $(DOCKER_REPO)/$(APP_NAME) $(DOCKER_REPO)/$(APP_NAME):latest

tag-version: ## Generate container `{version}` tag
	@echo 'create tag $(VERSION)'
	docker tag $(DOCKER_REPO)/$(APP_NAME) $(DOCKER_REPO)/$(APP_NAME):$(VERSION)


# Login to Docker Repository
repo-login: ## Login to Docker Repository
	docker login $(DOCKER_REPO)


# Docker clean
builder-clean: ## Remove build cache
	docker builder prune -af

containers-clean: ## Remove unnecessary containers
	docker rm $(docker ps -q -f 'status=exited')

images-clean: ## Remove unnecessary images
	docker rmi $(docker images -q -f "dangling=true")

system-clean: ## Remove all unused containers, networks, images (both dangling and unreferenced), and volumes
	docker system prune -af --volumes

clean: builder-clean containers-clean images-clean system-clean ## Clean all unused docker data


# Output variables
version: ## Output the current version
	@echo $(VERSION)

app-name: ## Output the application name
	@echo $(APP_NAME)
