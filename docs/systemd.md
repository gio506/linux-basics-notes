# systemd

## Why it matters
Most modern Linux distributions manage services with `systemd`.

## Useful commands
```bash
systemctl status ssh
systemctl list-units --type=service --state=running
systemctl is-enabled cron
```

## Journal and service debugging
```bash
journalctl -u ssh -n 50 --no-pager
sudo systemctl restart ssh
```

## Practical exercise
```bash
systemctl --failed
systemctl status NetworkManager || true
```
