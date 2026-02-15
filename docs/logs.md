# Logs

## Why it matters
Logs are your first source of truth when something fails.

## Common log locations
- `/var/log/syslog` (Debian/Ubuntu)
- `/var/log/messages` (RHEL/CentOS/Fedora)
- `/var/log/auth.log` (authentication events)

## Useful commands
```bash
journalctl -xe --no-pager
journalctl -u ssh -n 100 --no-pager
tail -f /var/log/syslog
```

## Practical exercise
```bash
journalctl -n 20 --no-pager
sudo tail -n 20 /var/log/auth.log
```
