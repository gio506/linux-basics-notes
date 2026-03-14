# linux-basics-notes

[![CI](https://github.com/<your-username>/linux-basics-notes/actions/workflows/ci.yml/badge.svg)](https://github.com/<your-username>/linux-basics-notes/actions/workflows/ci.yml)

## What this repo is for

`linux-basics-notes` is a practical Linux fundamentals lab for learning core
administration and troubleshooting skills with copy-paste commands, safe
scripts, and repeatable checks.

This repo is useful for:

- building Linux command confidence before Terraform, Docker, or Kubernetes
- revising core troubleshooting paths during interviews or labs
- keeping a short, safe script collection for read-only system inspection

## What you will learn

- Filesystem layout and navigation
- Permissions, ownership, and safe file handling
- Users, groups, and privilege basics
- Process inspection and control
- Network checks and listening port inspection
- `systemd` and journal troubleshooting
- Basic log investigation habits

## Quick start

```bash
git clone https://github.com/<your-username>/linux-basics-notes.git
cd linux-basics-notes
git checkout dev
chmod +x scripts/*.sh
./scripts/show_sysinfo.sh
./scripts/find_large_files.sh . 20
./scripts/check_ports.sh
```

## Topics index

- `LINUX_BASICS.md`
- `docs/filesystem.md`
- `docs/identity-permissions.md`
- `docs/processes-services-logs.md`
- `docs/networking.md`
- `docs/troubleshooting.md`
- `CHEATSHEET.md`

## Local checks

```bash
./scripts/lint_markdown.sh
./scripts/check_markdown_links.sh
shellcheck scripts/*.sh
for f in scripts/*.sh; do bash -n "$f"; done
./scripts/vm_preflight.sh --strict
./scripts/smoke_test.sh
```

## Repo Map

```text
linux-basics-notes/
├── .github/workflows/ci.yml        # Ordered CI checks for docs, shell, preflight, and smoke
├── docs/                           # Topic notes and troubleshooting guides
├── scripts/
│   ├── show_sysinfo.sh             # Read-only host information report
│   ├── find_large_files.sh         # Large-file scanner with dry-run support
│   ├── check_ports.sh              # Listening port inspector for TCP/UDP
│   ├── lint_markdown.sh            # Lightweight markdown formatting checks
│   ├── check_markdown_links.sh     # Validates local markdown links
│   ├── vm_preflight.sh             # Checks VM readiness and required commands
│   └── smoke_test.sh               # Non-destructive script smoke test runner
├── CHEATSHEET.md                   # Linux command map with practical examples
├── FILES_EXPLAINED.md              # File-by-file repo guide
├── LINUX_BASICS.md                 # Combined notes for quick reading
├── package.json                    # Optional markdown tooling metadata
└── README.md                       # Main guide and usage explanation
```

## CI pipeline

The workflow is split into six stages:

1. `structure-check`
2. `markdown-and-links`
3. `shellcheck`
4. `bash-syntax`
5. `vm-preflight`
6. `scripts-smoke`

## Contributing

1. Work on `dev`.
2. Keep commands safe and copy-paste friendly.
3. Prefer read-only examples over destructive demos.
4. Open a pull request from `dev` into `main`.

## License

MIT License. See `LICENSE`.
