# Users and groups

## Concepts
- Users identify accounts.
- Groups simplify shared permissions.
- `sudo` allows controlled privilege elevation.

## Useful commands
```bash
id
whoami
getent passwd | head
getent group | head
sudo useradd -m bob
sudo passwd bob
sudo usermod -aG sudo bob
sudo userdel -r bob
```

## Best practices
- Avoid daily work as `root`.
- Grant least privilege through groups.
- Use dedicated service accounts for daemons.
