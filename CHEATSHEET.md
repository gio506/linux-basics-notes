# Linux Basics Cheatsheet

A quick map of common commands, what they are for, and when to use them.

## Navigation and filesystem
- `pwd` - show current directory.
- `ls -lah` - list files with details and hidden entries.
- `cd <dir>` - move into a directory.
- `find <path> -type f` - find files recursively.

## Permissions and ownership
- `ls -l` - inspect permission bits and ownership.
- `chmod 640 <file>` - change permissions.
- `chown user:group <file>` - change owner and group.

## Users and groups
- `whoami` - show current user.
- `id` - show user ID, group ID, and memberships.
- `groups` - list group memberships.

## Processes
- `ps aux` - snapshot all running processes.
- `pgrep -a <name>` - find process IDs by name.
- `kill <pid>` - gracefully stop a process.

## Networking
- `ip a` - show interfaces and IP addresses.
- `ip route` - show routing table.
- `ss -tuln` - list listening TCP/UDP sockets.

## Services and logs
- `systemctl status <service>` - service health/status.
- `journalctl -u <service> -n 50` - recent service logs.
- `tail -f /var/log/syslog` - follow live logs.

## Safe practice tip
Before running admin commands, first inspect with read-only commands (`ls`, `ps`, `ss`, `journalctl`) to build confidence.
