# systemd

## What is systemd?
`systemd` is the init system and service manager on most modern Linux distros.

## Daily commands
```bash
systemctl status nginx
sudo systemctl start nginx
sudo systemctl stop nginx
sudo systemctl restart nginx
sudo systemctl enable nginx
sudo systemctl disable nginx
systemctl list-units --type=service --state=running
```

## Unit file locations
- `/etc/systemd/system` for local/custom units.
- `/usr/lib/systemd/system` or `/lib/systemd/system` for packaged units.

## When unit files change
```bash
sudo systemctl daemon-reload
sudo systemctl restart <service>
```
