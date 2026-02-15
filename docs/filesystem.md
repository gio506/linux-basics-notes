# Filesystem

## Why it matters
The Linux filesystem is where everything lives: files, devices, logs, and config.

## Core ideas
- `/` is the root directory.
- Absolute path starts with `/` (example: `/etc/hosts`).
- Relative path starts from your current directory.

## Important directories
- `/home` - user home directories.
- `/etc` - system-wide configuration.
- `/var/log` - log files.
- `/tmp` - temporary files.
- `/usr/bin` - many installed user commands.

## Useful commands
```bash
pwd
ls -lah
cd /etc
find . -maxdepth 2 -type d
```

## Practical exercise
```bash
mkdir -p ~/lab/fs-demo
cd ~/lab/fs-demo
touch notes.txt
mkdir examples
mv notes.txt examples/
find . -maxdepth 2 -print
```
