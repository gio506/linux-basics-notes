# Users and Groups

## Core concepts

- Users identify accounts; groups simplify shared access.
- Least privilege means granting only required permissions.
- `sudo` allows temporary elevation when configured.

## Useful commands

```bash
whoami
id
groups
getent passwd "$USER"
```

## Example output

```text
$ id
uid=1000(dev) gid=1000(dev) groups=1000(dev),27(sudo)
```

## Troubleshooting

- User cannot run sudo: verify membership in sudo/wheel group.
- Group access not applied: user may need a new login session.
- Missing account lookup: validate `/etc/nsswitch.conf` and identity provider.
