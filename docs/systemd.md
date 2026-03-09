# systemd

## Core concepts

- `systemd` manages services as units.
- Unit states show active/failed/inactive status.
- Journal stores service logs for diagnosis.

## Useful commands

```bash
systemctl status ssh
systemctl list-units --type=service --state=running
journalctl -u ssh -n 50 --no-pager
```

## Example output

```text
$ systemctl is-enabled ssh
enabled
```

## Troubleshooting

- Service failed to start: read `journalctl -u <unit>` first.
- Unit not found: confirm name with `systemctl list-unit-files`.
- Config changed but ignored: run `sudo systemctl daemon-reload`.
