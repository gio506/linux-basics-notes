# linux-basics-notes

## Overview
This repository is a beginner-friendly Linux learning path with concise notes and safe, runnable script examples.

## What you'll learn
- How Linux filesystems are structured and navigated.
- How permissions, ownership, and access control work.
- How users, groups, and processes are managed.
- How to inspect networking, logs, and services with `systemd`.
- How to use practical shell scripts for everyday diagnostics.

## Quick start
1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/linux-basics-notes.git
   cd linux-basics-notes
   ```
2. Make scripts executable:
   ```bash
   chmod +x scripts/*.sh
   ```
3. Run demos:
   ```bash
   ./scripts/show_sysinfo.sh
   ./scripts/find_large_files.sh . 20
   ./scripts/check_ports.sh
   ```

## Topics index
- [Filesystem basics](docs/filesystem.md)
- [Permissions](docs/permissions.md)
- [Users and groups](docs/users-groups.md)
- [Processes](docs/processes.md)
- [Networking](docs/networking.md)
- [systemd services](docs/systemd.md)
- [Logs and journaling](docs/logs.md)
- [Quick command cheatsheet](docs/cheatsheet.md)

## Repository tree
```text
.
├── .github/workflows/ci.yml         # CI pipeline: ShellCheck + Markdown linting
├── docs/
│   ├── filesystem.md                # Files, directories, paths, and navigation commands
│   ├── permissions.md               # chmod/chown/chgrp and permission troubleshooting
│   ├── users-groups.md              # User accounts, groups, and account management basics
│   ├── processes.md                 # Process lifecycle, monitoring, and signal handling
│   ├── networking.md                # IP, DNS, routes, and port-inspection essentials
│   ├── systemd.md                   # Managing services, units, and boot targets with systemd
│   ├── logs.md                      # journalctl and common log file workflows
│   └── cheatsheet.md                # Fast lookup table: command, purpose, and common usage
├── scripts/
│   ├── show_sysinfo.sh              # Safe system inventory snapshot
│   ├── find_large_files.sh          # Locate large files by size threshold
│   └── check_ports.sh               # Show listening ports and owning processes
└── README.md                        # Project overview, setup, and navigation
```

## Contributing
Contributions are welcome. Open an issue or PR for:
- Clarifications for beginners.
- Better command examples.
- Additional safe demo scripts.

Please keep notes concise and practical, and test any script updates locally.

## License
This project is licensed under the MIT License. See [LICENSE](LICENSE).
