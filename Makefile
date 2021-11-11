# Copyright © 2021 Kris Nóva <kris@nivenly.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http:#www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

all: help

build: falco falco-bin falco-git falco-playground ## Build all falco packages locally

publish: clean ## Publish the packages to AUR! Nóva this is the command you are looking for!
	@./publish

clean: ## Clean the local assets
	@touch aur/clean
	@rm -rvf aur/*

falco: clean ## Build falco
	@echo "Building..."
	cp -rv falco/* aur
	cd aur && makepkg -si


falco-bin: clean ## Build falco-bin
	@echo "Building..."
	cp -rv falco-bin/* aur
	cd aur && makepkg -si


falco-git: clean ## Build falco-git
	@echo "Building..."
	cp -rv falco-git/* aur
	cd aur
	makepkg -si

falco-playground: clean ## Build falco-playground
	@echo "Building..."
	cp -rv falco-playground/* aur
	cd aur
	makepkg -si

.PHONY: help
help:  ## Show help messages for make targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}'
