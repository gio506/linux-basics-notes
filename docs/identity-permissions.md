# Identity and Permissions

## Core concepts

- Users and groups define *who* can access resources.
- Permissions (`rwx`) define *what* actions are allowed.
- Least privilege means giving minimum required access.

## Useful commands

```bash
whoami
id
groups
ls -l
chmod 640 file.txt
chown user:group file.txt
```

## Example output

```text
$ id
uid=1000(dev) gid=1000(dev) groups=1000(dev),27(sudo)
```

## Troubleshooting

- Access denied: verify owner/group with `ls -l` and your groups via `id`.
- Script not executable: run `chmod u+x script.sh`.
- Sudo not working: confirm sudo/wheel membership and re-login.
