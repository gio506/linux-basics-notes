# Processes, Services, and Logs

## Core concepts

- Processes are running programs identified by PID.
- `systemd` controls service lifecycle on modern Linux.
- Logs (`journalctl`, `/var/log/*`) are the first source of truth.

## Useful commands

```bash
ps aux | head -n 10
pgrep -a ssh
systemctl status ssh
journalctl -u ssh -n 50 --no-pager
tail -f /var/log/syslog
```

## Example output

```text
$ systemctl is-enabled ssh
enabled
```

## Troubleshooting

- Process keeps restarting: check owning service with `systemctl status`.
- Service fails startup: inspect `journalctl -u <unit>` immediately.
- Missing log lines: check rotated logs and permissions.
