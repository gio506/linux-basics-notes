# Contributing to linux-basics-notes

Thank you for your interest in contributing! This repository is a collection of Linux fundamentals notes and safe Bash scripts, built as a learning resource.

## Getting Started

1. **Fork** the repository and clone your fork locally
2. **Install prerequisites:**
   ```bash
   sudo apt-get install shellcheck       # shell linting
   npm install -g markdownlint-cli       # markdown linting
   ```
3. **Create a feature branch:**
   ```bash
   git checkout -b feat/your-topic
   ```

## Contribution Guidelines

### Scripts (`scripts/`)

- All scripts must pass `shellcheck` with no errors or warnings
- Use `#!/usr/bin/env bash` as the shebang line
- Include a `# Purpose:` comment at the top of each script
- Scripts must be safe to run on a standard Ubuntu VM — no destructive operations
- Test your script with `bash -n yourscript.sh` before committing

### Markdown Notes

- All `.md` files must pass `markdownlint` (see `.markdownlint.json` for config)
- Use ATX-style headings (`#`, `##`, `###`)
- Code blocks must include a language specifier (e.g., ` ```bash `)
- Keep line length ≤ 120 characters

### Commit Style

Follow [Conventional Commits](https://www.conventionalcommits.org/):
```
feat(scripts): add disk usage report script
fix(markdown): correct broken link in LINUX_BASICS.md
docs: add section on systemd unit files
```

## Running CI Checks Locally

```bash
# ShellCheck all scripts
shellcheck scripts/*.sh

# Bash syntax check
for f in scripts/*.sh; do bash -n "$f"; done

# Markdown lint
markdownlint "**/*.md"
```

## Pull Request Checklist

Before opening a PR, ensure:
- [ ] Scripts pass `shellcheck` with no issues
- [ ] Markdown files pass `markdownlint`
- [ ] No hardcoded credentials or sensitive data
- [ ] Commit messages follow Conventional Commits format
- [ ] PR description explains the change clearly
