
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

configure-link-check: setup-workflows-dir
	@if [ -f "../.github/workflows/link-check.yaml" ]; then echo "ERROR: .github/workflows/link-check.yaml already exists"; exit 1; fi
	@if [ -f "../.lycheeignore" ]; then echo "ERROR: .lycheeignore already exists"; exit 1; fi
	ln .github/workflows/link-check.yaml ../.github/workflows/link-check.yaml
	ln .lycheeignore ../.lycheeignore
	@echo "Link checking configured to use Swiss Army Knife!"

configure-secret-scan: setup-workflows-dir
	@if [ -f "../.github/workflows/secret-scan.yaml" ]; then echo "ERROR: .github/workflows/secret-scan.yaml already exists"; exit 1; fi
	ln .github/workflows/secret-scan.yaml ../.github/workflows/secret-scan.yaml
	@echo "Secret scanning configured to use Swiss Army Knife!"

remove-commit-lint:
	@if [ -f "../.github/workflows/commit-lint.yaml" ]; then rm ../.github/workflows/commit-lint.yaml; fi
	@if [ -f "../commitlint.config.js" ]; then rm ../commitlint.config.js; fi
	@echo "Commit linting removed!"

remove-label-lint:
	@if [ -f "../.github/workflows/label-lint.yaml" ]; then rm ../.github/workflows/label-lint.yaml; fi
	@echo "Label linting removed!"

remove-link-check:
	@if [ -f "../.github/workflows/link-check.yaml" ]; then rm ../.github/workflows/link-check.yaml; fi
	@if [ -f "../.lycheeignore" ]; then rm ../.lycheeignore; fi
	@echo "Link checking removed!"

remove-secret-scan:
	@if [ -f "../.github/workflows/secret-scan.yaml" ]; then rm ../.github/workflows/secret-scan.yaml; fi
	@echo "Secret scanning removed!"

remove-all: remove-commit-lint remove-label-lint remove-link-check remove-secret-scan
	@echo "All configurations have been removed!"

configure-all: configure-commit-lint configure-label-lint configure-link-check configure-secret-scan
	@echo "All configurations have been set up to use Swiss Army Knife!"