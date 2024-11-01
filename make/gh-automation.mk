
WORKFLOWS := commit-lint.yaml label-lint.yaml link-check.yaml secret-scan.yaml spell-check.yaml
CONFIG_FILES := .lycheeignore commitlint.config.js cspell.json

SOURCE_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST)))/../)
SOURCE_WORKFLOWS_DIR := $(SOURCE_DIR)/.github/workflows
TARGET_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST)))/../../)
TARGET_WORKFLOWS_DIR := $(TARGET_DIR)/.github/workflows

.PHONY: .setup-workflows-dir .remove-workflows-dir

.setup-workflows-dir:
	@if [ ! -d "$(TARGET_WORKFLOWS_DIR)" ]; then mkdir -p $(TARGET_WORKFLOWS_DIR); fi

.remove-workflows-dir:
	@if [ -d "$(TARGET_WORKFLOWS_DIR)" ]; then rm -rf $(TARGET_WORKFLOWS_DIR); fi

.remove-workflows-config:
	@for config in $(CONFIG_FILES); do \
		if [ -f "$(TARGET_DIR)/$$config" ]; then rm $(TARGET_DIR)/$$config; fi; \
	done

workflows-install: .setup-workflows-dir ## Installs the GitHub workflows
	@echo "Installing workflows"
	@for workflow in $(WORKFLOWS); do \
		ln $(SOURCE_WORKFLOWS_DIR)/$$workflow $(TARGET_WORKFLOWS_DIR)/$$workflow; \
	done
	@for config in $(CONFIG_FILES); do \
		ln $(SOURCE_DIR)/$$config $(TARGET_DIR)/$$config; \
	done
	@echo "GitHub workflows installed at: $(TARGET_WORKFLOWS_DIR)"
	@echo "Workflows: $(WORKFLOWS)"
	@echo "Config files installed at: $(TARGET_DIR)"
	@echo "Config files: $(CONFIG_FILES)"
	@echo "GitHub workflows installed!"

workflows-remove: .remove-workflows-dir .remove-workflows-config ## UNSAFE: Removes the GitHub workflows directory
	@echo "Removed workflows directory: $(TARGET_WORKFLOWS_DIR)"
	@echo "Removed workflows: $(WORKFLOWS)"
	@echo "Removed config files: $(CONFIG_FILES)"
	@echo "GitHub workflows removed!"
