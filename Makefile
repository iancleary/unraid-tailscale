PHONY: help

# Docker namespace, image name and version/tag
NS?= iancleary
IMAGE_NAME?= unraid-tailscale
LATEST?= latest

IMAGE=$(NS)/$(IMAGE_NAME)

# Shell that make should use
SHELL:=bash

# - to suppress if it doesn't exist
include make.env

help:
# http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
# adds anything that has a double # comment to the phony help list
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ".:*?## "}; {printf "\033[36m%-25s\033[0m %s\n", $$1, $$2}'

build:
build: ## Make the latest build of the image (version is defined in make.env)
	./build.sh $(IMAGE) $(VERSION)

push: 
push: ## push the latest version to docker hub (version is defined in make.env)
	docker push $(IMAGE):$(VERSION)
	docker push $(IMAGE):$(LATEST)

change:
change: ## change to a new version (make change BUMP=1.34.2)
	@find . -type f -exec sed -i 's/$(VERSION)/$(BUMP)/g' {} \;

.DEFAULT_GOAL := help
