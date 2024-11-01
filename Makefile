.PHONY: help setup-workflows-dir configure-spell-check configure-commit-lint configure-label-lint configure-link-check configure-secret-scan remove-spell-check remove-commit-lint remove-label-lint remove-link-check remove-secret-scan remove-all configure-all

include make/gh-templates.mk
include make/gh-automation.mk

help: ## Display this help information. Use 'make help <prefix>' to filter targets
	@if [ "$(filter-out help,$(MAKECMDGOALS))" ]; then \
		awk 'BEGIN {FS = ":.*##"; printf "\033[36m%-30s\033[0m %s\n", "Target", "Description"} \
		/^$(filter-out help,$(MAKECMDGOALS))[a-zA-Z0-9_-]*:.*?##/ { printf "\033[36m%-30s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST); \
	else \
		awk 'BEGIN {FS = ":.*##"; printf "\033[36m%-30s\033[0m %s\n", "Target", "Description"} \
		/^[a-zA-Z0-9_-]+:.*?##/ { printf "\033[36m%-30s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST); \
	fi

%: # Catch-all rule to allow additional arguments
	@:

install: templates-install workflows-install ## Installs all of the artifacts contained in Swiss Army Knife

remove: templates-remove workflows-remove ## UNSAFE: Removes all of the artifacts contained in Swiss Army Knife