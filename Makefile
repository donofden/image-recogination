HOME ?= `$HOME`
PWD ?= `pwd`

help: ## Welcome
	### Welcome
	#
	### Installation
	#
	#  -> $$ make setup
	#
	### Targets
	@cat Makefile* | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: run
run: ## Pick the image from the folder and recognize the objects in it.
	@echo '##'
	@echo '# Processing..'
	@echo '##'
	python3 detect.py

.PHONY: install
install: ## Install Python Dependencies
	pip3 install -r requirements.txt
	wget -O resnet.h5 https://github.com/OlafenwaMoses/ImageAI/releases/download/1.0/resnet50_coco_best_v2.0.1.h5