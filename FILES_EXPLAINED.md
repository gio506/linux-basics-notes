# Files Explained

## Root files

- `README.md`
  - Main onboarding guide, local commands, and CI overview.
- `CHEATSHEET.md`
  - Quick command reference grouped by Linux topic.
- `LINUX_BASICS.md`
  - Main study notes with explanations and practice snippets.
- `FILES_EXPLAINED.md`
  - File-by-file explanation for learners and reviewers.
- `LICENSE`
  - Repository license.
- `package.json`
  - Optional metadata for Markdown tooling.
- `.markdownlint.json`
  - Markdown lint configuration.

## Docs

- `docs/filesystem.md`
  - Filesystem concepts, commands, and quick practice.
- `docs/identity-permissions.md`
  - Combined users, groups, and permission guide.
- `docs/networking.md`
  - Interface, route, port, and connectivity notes.
- `docs/processes-services-logs.md`
  - Process, service, and logging operations.
- `docs/troubleshooting.md`
  - Cross-topic quick triage checklist.
- `docs/permissions.md`, `docs/users-groups.md`, `docs/processes.md`,
  `docs/systemd.md`, `docs/logs.md`
  - Thin compatibility pointer docs retained by the repo.

## Scripts

- `scripts/show_sysinfo.sh`
  - Prints safe system information such as OS, CPU, memory, and disk details.
- `scripts/find_large_files.sh`
  - Searches for files larger than a chosen threshold without modifying them.
- `scripts/check_ports.sh`
  - Lists local listening TCP and UDP ports for troubleshooting.
- `scripts/lint_markdown.sh`
  - Lightweight Markdown checks used locally and in CI.
- `scripts/check_markdown_links.sh`
  - Validates local Markdown links.
- `scripts/vm_preflight.sh`
  - Checks for the commands expected in a Linux VM lab.
- `scripts/smoke_test.sh`
  - Runs safe validation checks so CI can confirm the scripts still work.

## GitHub Actions

- `.github/workflows/ci.yml`
  - Runs structure checks, docs checks, shell linting, syntax validation,
    VM preflight, and final smoke tests.
