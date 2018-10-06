.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[0-9a-zA-Z_-]+:.*?## / {printf "\033[36m%-40s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# DOCKER TASKS
firefox_x11: ## [X11]        Build Mozilla Firefox web browser Image
	@cd firefox && ./build.sh
	@printf "\n\033[92mDocker Image: turlucode/firefox:latest\033[0m\n"

mendeley_nvidia: ## [NVIDIA-X11] Build Mendeley Desktop Image
	@cd mendeley && ./build.sh nvidia-ubuntu
	@printf "\n\033[92mDocker Image: turlucode/mendeley-nvidia:latest\033[0m\n"
