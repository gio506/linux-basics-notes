# linux-basics-notes

## Overview
A beginner-friendly Linux learning repository with concise notes and safe, runnable examples.  
It is designed for daily practice: read a topic, run a script, and verify behavior on your own machine.

## What you'll learn
- How Linux filesystem paths and directory structure work.
- How file permissions and ownership control access.
- How users and groups are managed.
- How to inspect and manage processes.
- How to inspect networking and open ports.
- How `systemd` services and units are controlled.
- How to read and troubleshoot logs.

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
- [Filesystem notes](docs/filesystem.md)
- [Permissions notes](docs/permissions.md)
- [Users and groups notes](docs/users-groups.md)
- [Processes notes](docs/processes.md)
- [Networking notes](docs/networking.md)
- [systemd notes](docs/systemd.md)
- [Logs notes](docs/logs.md)

## Repository tree
```text
linux-basics-notes/
├── .github/workflows/ci.yml         # CI pipeline: shellcheck + markdown lint
├── docs/
│   ├── filesystem.md                # Linux paths, directories, and navigation basics
│   ├── permissions.md               # chmod/chown/chgrp and permission model
│   ├── users-groups.md              # User accounts, groups, and sudo basics
│   ├── processes.md                 # Process lifecycle, monitoring, and signals
│   ├── networking.md                # Interfaces, routes, DNS, and port checks
│   ├── systemd.md                   # Service/unit control and troubleshooting
│   └── logs.md                      # journalctl and log file investigation
├── scripts/
│   ├── show_sysinfo.sh              # Prints OS, kernel, uptime, CPU, memory, disk
│   ├── find_large_files.sh          # Finds large files under a chosen directory
│   └── check_ports.sh               # Lists listening TCP/UDP ports safely
├── CHEATSHEET.md                    # Quick command map: what to use and when
└── README.md                        # Project overview and onboarding
```

## Contributing
1. Fork the repository and create a feature branch.
2. Keep notes concise and command examples copy-pasteable.
3. Ensure scripts are safe (no destructive commands).
4. Run checks before opening a PR.

```bash
shellcheck scripts/*.sh
npx markdownlint-cli2 "**/*.md"
```

## License
MIT License (see `LICENSE` file).
