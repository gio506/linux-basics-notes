# linux-basics-notes

[![CI](https://github.com/<your-username>/linux-basics-notes/actions/workflows/ci.yml/badge.svg)](https://github.com/<your-username>/linux-basics-notes/actions/workflows/ci.yml)

## Overview

A practical mini Linux lab for learning core administration and troubleshooting
skills with copy-paste commands, safe scripts, and repeatable checks.

## Setup

```bash
git clone https://github.com/<your-username>/linux-basics-notes.git
cd linux-basics-notes
git checkout dev
chmod +x scripts/*.sh
```

## Topics Index

- [Filesystem](docs/filesystem.md)
- [Permissions](docs/permissions.md)
- [Users and groups](docs/users-groups.md)
- [Processes](docs/processes.md)
- [Networking](docs/networking.md)
- [systemd](docs/systemd.md)
- [Logs](docs/logs.md)
- [Troubleshooting playbook](docs/troubleshooting.md)
- [Top commands cheatsheet](CHEATSHEET.md)

## Repo Map

- `.github/workflows/ci.yml` - CI pipeline with markdown checks, shellcheck, and
  script smoke tests.
- `.gitkeep` - placeholder file retained for repository scaffolding.
- `.markdownlint.json` - markdownlint configuration used locally and in CI.
- `docs/filesystem.md` - Linux filesystem layout, practice commands, and fixes.
- `docs/permissions.md` - file mode and ownership reference with troubleshooting.
- `docs/users-groups.md` - account/group fundamentals and safe admin checks.
- `docs/processes.md` - process inspection, signals, and debugging flow.
- `docs/networking.md` - host networking commands and connectivity checks.
- `docs/systemd.md` - service lifecycle and unit troubleshooting guide.
- `docs/logs.md` - log sources and command patterns for investigations.
- `docs/troubleshooting.md` - cross-topic quick triage checklist.
- `scripts/show_sysinfo.sh` - read-only host information report.
- `scripts/find_large_files.sh` - safe large-file scanner with optional dry-run.
- `scripts/check_ports.sh` - listening port inspector for TCP/UDP.
- `scripts/lint_markdown.sh` - lightweight markdown style checks.
- `scripts/check_markdown_links.sh` - validates local markdown links.
- `scripts/smoke_test.sh` - non-destructive script smoke test runner.
- `CHEATSHEET.md` - top 30 Linux commands with examples.
- `FILES_EXPLAINED.md` - one-line purpose for every tracked repo file.
- `LINUX_BASICS.md` - legacy combined notes file kept for quick single-file reading.
- `package.json` - Node metadata kept for optional markdown tooling usage.
- `LICENSE` - MIT license.
- `README.md` - onboarding, workflow, and checks entry point.

## Local checks

```bash
./scripts/lint_markdown.sh
./scripts/check_markdown_links.sh
shellcheck scripts/*.sh
./scripts/smoke_test.sh
```

## CI

The pipeline runs 3 ordered stages:

1. markdown lint + markdown link check,
2. shellcheck,
3. scripts smoke tests.

All changes must pass CI before merge.

## Contributing

- Branch model: `main` is stable, all work happens on `dev`.
- Open pull requests from `dev` to `main`.
- Repository settings should require PR review and passing CI for `main` updates.
- Use short, human-friendly commit messages (example: `Add logs troubleshooting`).

## License

MIT (`LICENSE`).
