# linux-basics-notes

## Overview
A practical, beginner-first Linux notebook with safe scripts you can run on a local VM or lab machine.
Short notes, real commands, no destructive examples.

## What you'll learn
- How Linux files and folders are organized
- How permissions, users, and groups work in real life
- How to check processes, ports, services, and logs when something breaks
- How to collect quick system snapshots with reusable scripts

## Quick start
```bash
git clone https://github.com/<your-user>/linux-basics-notes.git
cd linux-basics-notes
chmod +x scripts/*.sh
./scripts/show_sysinfo.sh --top 5
```

## Topics index
All notes live in one file: [`documentation.md`](documentation.md)
- [Filesystem](documentation.md#filesystem)
- [Permissions](documentation.md#permissions)
- [Users and groups](documentation.md#users-and-groups)
- [Processes](documentation.md#processes)
- [Networking](documentation.md#networking)
- [systemd](documentation.md#systemd)
- [Logs](documentation.md#logs)
- [Linux command cheatsheet](documentation.md#linux-command-cheatsheet)
- [Official references](documentation.md#official-references)

## Project tree
```text
linux-basics-notes/
├── .github/workflows/ci.yml   # CI checks (shellcheck + markdown lint)
├── documentation.md           # Main study notes + cheatsheet
├── scripts/
│   ├── show_sysinfo.sh        # Quick system snapshot + top CPU processes
│   ├── find_large_files.sh    # Find big files with optional filters
│   └── check_ports.sh         # Show listening ports (tcp/udp/process filter)
├── LICENSE                    # MIT license
└── README.md                  # Start here
```

## Contributing
- Keep examples safe and beginner-friendly.
- Run checks locally before commit.
- Prefer references from official docs (`man`, distro docs, or upstream project docs).
- Use short, human commit messages (example: `Polish cheatsheet wording`).

## License
MIT. See [LICENSE](LICENSE).
