# Users and Groups

## Why it matters
Linux uses users and groups to separate privileges and limit damage.

## Useful commands
```bash
whoami
id
groups
getent passwd "$USER"
```

## Admin-related commands
```bash
sudo useradd -m trainee
sudo usermod -aG sudo trainee
sudo groupadd devops
```

## Practical exercise
```bash
id
getent group sudo
```
Check whether your account is part of elevated groups.
