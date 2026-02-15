# linux-basics-notes

## Overview

A beginner-friendly Linux learning repository with concise notes and safe,
runnable examples.

This project is designed for daily practice:
read one topic, run one script, and verify behavior on your own machine.

## What you'll learn

- Linux filesystem structure and navigation.
- File permissions and ownership.
- Users, groups, and basic privilege concepts.
- Process inspection and control.
- Networking checks and open-port inspection.
- `systemd` service management basics.
- Log investigation workflows.

## Quick start

```bash
git clone https://github.com/<your-username>/linux-basics-notes.git
cd linux-basics-notes
chmod +x scripts/*.sh

# Run safe demo scripts
./scripts/show_sysinfo.sh
./scripts/find_large_files.sh . 20
./scripts/check_ports.sh
```

## Topics index

- [All Linux basics notes](LINUX_BASICS.md)
- [Command cheatsheet](CHEATSHEET.md)

## Repository tree

```text
linux-basics-notes/
├── .github/workflows/ci.yml   # CI: ShellCheck + markdown lint
├── scripts/
│   ├── show_sysinfo.sh        # Shows OS, CPU, memory, disk info
│   ├── find_large_files.sh    # Finds large files safely
│   └── check_ports.sh         # Lists listening TCP/UDP ports
├── LINUX_BASICS.md            # Single combined Linux notes document
├── CHEATSHEET.md              # Expanded command quick reference
├── README.md                  # Onboarding and repo structure
└── LICENSE                    # MIT license
```

## Contributing

1. Fork the repository and create a feature branch.
2. Keep notes concise and commands copy-paste friendly.
3. Keep scripts safe and non-destructive.
4. Run checks before opening a pull request.

```bash
shellcheck scripts/*.sh
npx markdownlint-cli "**/*.md"
```

## License

MIT License (see `LICENSE`).
