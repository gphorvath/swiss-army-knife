# GitHub Workflows

## Commit Lint Workflow

Based on <https://commitlint.js.org/>.

Key components:

```bash
.  
├── commit-lint.config.js  
└── .github  
    └── workflows  
        └── commit-lint.yaml
```

The commit lint workflow ensures that all pull request titles follow a specified convention. This helps maintain a consistent commit history and improves the readability of the project's commit log.

## Label Lint Workflow

Based on <https://github.com/yogevbd/enforce-label-action>.

Key components:

```bash
.  
└── .github  
    └── workflows  
        └── label-lint.yaml
```

The label lint workflow ensures that all pull requests have the appropriate labels before they are merged, helping to categorize and prioritize tasks effectively.

## Secret Scanning Workflow

For more information:

* <https://docs.github.com/en/code-security/secret-scanning>
* <https://github.com/trufflesecurity/trufflehog>

Key components:

```bash
.  
└── .github  
    └── workflows  
        └── secret-scanning.yaml
```

The secret scanning workflow ensures that no sensitive information such as API keys, passwords, or tokens are committed to the repository. This helps to prevent security breaches and protects the integrity of the project.
