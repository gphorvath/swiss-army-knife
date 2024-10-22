
setup-workflows-dir:
	@if [ ! -d "../.github/workflows" ]; then mkdir -p ../.github/workflows; fi

configure-commit-lint: setup-workflows-dir
	@if [ -f "../.github/workflows/commit-lint.yaml" ]; then echo "ERROR: .github/workflows/commit-lint.yaml already exists"; exit 1; fi
	@if [ -f "../commitlint.config.js" ]; then echo "ERROR: commitlint.config.js already exists"; exit 1; fi
	ln .github/workflows/commit-lint.yaml ../.github/workflows/commit-lint.yaml
	ln commitlint.config.js ../commitlint.config.js
	@echo "Commit linting configured to use Swiss Army Knife!"

configure-label-lint: setup-workflows-dir
	@if [ -f "../.github/workflows/label-lint.yaml" ]; then echo "ERROR: .github/workflows/label-lint.yaml already exists"; exit 1; fi
	ln .github/workflows/label-lint.yaml ../.github/workflows/label-lint.yaml
	@echo "Label linting configured to use Swiss Army Knife!"

remove-commit-lint:
	@if [ -f "../.github/workflows/commit-lint.yaml" ]; then rm ../.github/workflows/commit-lint.yaml; fi
	@if [ -f "../commitlint.config.js" ]; then rm ../commitlint.config.js; fi
	@echo "Commit linting removed!"

remove-label-lint:
	@if [ -f "../.github/workflows/label-lint.yaml" ]; then rm ../.github/workflows/label-lint.yaml; fi
	@echo "Label linting removed!"

remove-all: remove-commit-lint remove-label-lint
	@echo "All configurations have been removed!"
	
configure-all: configure-commit-lint configure-label-lint
	@echo "All configurations have been set up to use Swiss Army Knife!"