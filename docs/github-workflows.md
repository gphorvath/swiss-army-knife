# GitHub Workflows

## Table of Contents

- [cSpell Spell Check](#cspell-spell-check)
- [Lychee Link Check](#lychee-link-check)
- [Commit Lint](#commit-lint)
- [Label Lint](#label-lint)
- [Secret Scanning](#secret-scanning)

## cSpell Spell Check

Based on <https://github.com/streetsidesoftware/cspell>.

Key components:

```bash
.  
├── cspell.json  
└── .github  
    └── workflows  
        └── spell-check.yaml
```

The spell check workflow scans the repository for any spelling errors in the documentation and code. This helps ensure that the project's documentation and code are free from typos and spelling mistakes, improving readability and professionalism.

## Lychee Link Check

Based on <https://github.com/lycheeverse/lychee-action>

Key components:

```bash
.  
├── .lycheeignore
└── .github  
    └── workflows  
        └── link-check.yaml
```

The broken link check workflow scans the repository for any broken links in the documentation. This helps ensure that all links are valid and accessible, improving the overall quality and reliability of the project's documentation.

## Commit Lint

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

## Label Lint

Based on <https://github.com/yogevbd/enforce-label-action>.

Key components:

```bash
.  
└── .github  
    └── workflows  
        └── label-lint.yaml
```

The label lint workflow ensures that all pull requests have the appropriate labels before they are merged, helping to categorize and prioritize tasks effectively.

## Secret Scanning

For more information:

- <https://docs.github.com/en/code-security/secret-scanning>
- <https://github.com/trufflesecurity/trufflehog>

Key components:

```bash
.  
└── .github  
    └── workflows  
        └── secret-scanning.yaml
```

The secret scanning workflow ensures that no sensitive information such as API keys, passwords, or tokens are committed to the repository. This helps to prevent security breaches and protects the integrity of the project.
