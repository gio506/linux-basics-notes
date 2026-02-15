# Linux basics documentation

This guide is written like field notes: short explanation, then commands you can run immediately.

## Filesystem
Linux uses one tree rooted at `/` (root).

**Key paths**
- `/home`: user data
- `/etc`: configuration
- `/var`: logs and variable state
- `/tmp`: temporary files
- `/usr/bin`: common executables

**Commands**
```bash
pwd
ls -lah
find . -maxdepth 2 -type d
```

## Permissions
Each file has permissions for user, group, others (`rwx`).

**Commands**
```bash
ls -l
chmod 640 file.txt
chmod u+x script.sh
chown user:group file.txt
```

## Users and groups
Identity controls access and ownership.

**Commands**
```bash
whoami
id
groups
```

## Processes
Processes are running programs.

**Commands**
```bash
ps aux | head -n 10
pgrep -a ssh
kill -15 <pid>
```

## Networking
Check interfaces, routes, DNS, and listening ports.

**Commands**
```bash
ip a
ip route
ss -tuln
```

## systemd
Manage services and inspect service health.

**Commands**
```bash
systemctl status ssh
systemctl --failed
journalctl -u ssh -n 30 --no-pager
```

## Logs
Start broad, then narrow by service/time.

**Commands**
```bash
journalctl -xe --no-pager
journalctl -u nginx --since "1 hour ago" --no-pager
tail -f /var/log/syslog
```

## Linux command cheatsheet
Popular daily commands (safe and beginner-friendly):

| Command | Purpose | Example |
|---|---|---|
| `pwd` | Print current directory | `pwd` |
| `ls -lah` | List files with details | `ls -lah /var/log` |
| `cd` | Change directory | `cd /etc` |
| `mkdir -p` | Create directory path | `mkdir -p demo/test` |
| `cp -r` | Copy files/directories | `cp -r src backup/` |
| `mv` | Move/rename file | `mv old.txt new.txt` |
| `rm -i` | Remove with confirmation | `rm -i notes.txt` |
| `cat` | Print file contents | `cat /etc/os-release` |
| `less` | View file page-by-page | `less /var/log/syslog` |
| `grep -n` | Search text with line numbers | `grep -n "error" app.log` |
| `find` | Find files by condition | `find . -type f -name "*.sh"` |
| `du -sh` | Show directory size | `du -sh *` |
| `df -h` | Show disk usage | `df -h` |
| `free -h` | Show memory usage | `free -h` |
| `ps aux` | List running processes | `ps aux | head` |
| `top` | Interactive process monitor | `top` |
| `kill -15` | Graceful process stop | `kill -15 1234` |
| `ss -tuln` | Show listening sockets | `ss -tuln` |
| `ip a` | Show interfaces and addresses | `ip a` |
| `journalctl -u` | View service logs | `journalctl -u ssh -n 50` |

## Practice flow (repeat for any issue)
1. Reproduce the issue (don't guess).
2. Capture timestamp + affected service/process.
3. Inspect process, network, and logs around the same time window.
4. Apply one small fix at a time.
5. Re-check logs/status and confirm the error is gone.

## Official references
Use these to verify behavior and stay aligned with best practices:
- Linux man pages (local): `man bash`, `man find`, `man ps`, `man ss`, `man systemctl`, `man journalctl`.
- GNU coreutils docs: <https://www.gnu.org/software/coreutils/manual/coreutils.html>
- `findutils` manual: <https://www.gnu.org/software/findutils/manual/find.html>
- `iproute2` docs: <https://man7.org/linux/man-pages/man8/ss.8.html>
- systemd docs: <https://www.freedesktop.org/software/systemd/man/systemctl.html>
