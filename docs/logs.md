# Logs

## Core concepts

- Logs are primary evidence during incident triage.
- `journalctl` is preferred on `systemd` hosts.
- Application and auth logs can differ by distro.

## Useful commands

```bash
journalctl -xe --no-pager
journalctl -u ssh -n 100 --no-pager
tail -f /var/log/syslog
```

## Example output

```text
$ journalctl -u ssh -n 3 --no-pager
Accepted publickey for dev from 10.0.2.2 port 55218 ssh2
```

## Troubleshooting

- No journal entries: verify permissions or use sudo.
- Rotated log missing lines: inspect compressed files via `zgrep`.
- Time mismatch: confirm timezone and NTP synchronization.
