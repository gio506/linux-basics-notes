# Logs and journaling

## journalctl basics
```bash
journalctl -xe
journalctl -u ssh --since today
journalctl -b          # current boot
journalctl -b -1       # previous boot
journalctl -f          # follow logs live
```

## Traditional log files
Common locations:
- `/var/log/syslog`
- `/var/log/auth.log`
- `/var/log/kern.log`
- `/var/log/nginx/`

## Helpful commands
```bash
tail -f /var/log/syslog
less /var/log/auth.log
grep -i error /var/log/syslog
```

## Good habits
- Start with time-scoped queries.
- Correlate logs with service restarts and deployments.
