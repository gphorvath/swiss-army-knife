
ISSUE_TEMPLATES := bug_report.md feature_request.md chore.md
PR_TEMPLATE := pull_request_template.md
SOURCE_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST)))/../.github/)
SOURCE_ISSUE_TEMPLATE_DIR := $(SOURCE_DIR)/ISSUE_TEMPLATE
SOURCE_PR_TEMPLATE_DIR := $(SOURCE_DIR)/PULL_REQUEST_TEMPLATE
TARGET_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST)))/../../.github/)
TARGET_ISSUE_TEMPLATE_DIR := $(TARGET_DIR)/ISSUE_TEMPLATE
TARGET_PR_TEMPLATE_DIR := $(TARGET_DIR)/PULL_REQUEST_TEMPLATE

.PHONY: templates-install templates-remove .setup-templates-dir .remove-templates-dir

.setup-templates-dir:
	@if [ ! -d "$(TARGET_ISSUE_TEMPLATE_DIR)" ]; then mkdir -p $(TARGET_ISSUE_TEMPLATE_DIR); fi
	@if [ ! -d "$(TARGET_PR_TEMPLATE_DIR)" ]; then mkdir -p $(TARGET_PR_TEMPLATE_DIR); fi

.remove-templates-dir:
	@if [ -d "$(TARGET_ISSUE_TEMPLATE_DIR)" ]; then rm -rf $(TARGET_ISSUE_TEMPLATE_DIR); fi
	@if [ -d "$(TARGET_PR_TEMPLATE_DIR)" ]; then rm -rf $(TARGET_PR_TEMPLATE_DIR); fi

templates-install: .setup-templates-dir ## Installs the GitHub issue and PR templates
	@echo "Installing templates"
	@for template in $(ISSUE_TEMPLATES); do \
		ln $(SOURCE_ISSUE_TEMPLATE_DIR)/$$template $(TARGET_ISSUE_TEMPLATE_DIR)/$$template; \
	done
	@ln $(SOURCE_PR_TEMPLATE_DIR)/$(PR_TEMPLATE) $(TARGET_PR_TEMPLATE_DIR)/$(PR_TEMPLATE)
	@echo "GitHub issue templates installed at: $(TARGET_ISSUE_TEMPLATE_DIR)"
	@echo "Issue templates: $(ISSUE_TEMPLATES)"
	@echo "GitHub PR template installed at: $(TARGET_PR_TEMPLATE_DIR)"
	@echo "PR template: $(PR_TEMPLATE)"
	@echo "Issue and PR templates installed!"

templates-remove: .remove-templates-dir ## UNSAFE: Removes the GitHub issue and PR templates directories
	@echo "Removed issue templates directory: $(TARGET_ISSUE_TEMPLATE_DIR)"
	@echo "Removed issue templates: $(ISSUE_TEMPLATES)"
	@echo "Removed PR template directory: $(TARGET_PR_TEMPLATE_DIR)"
	@echo "Removed PR template: $(PR_TEMPLATE)"
	@echo "GitHub issue and PR templates removed!"
