# Permissions

## Core concepts

- Three classes: user, group, others.
- Three bits: read (`r`), write (`w`), execute (`x`).
- Common secure mode for secrets: `600`.

## Useful commands

```bash
ls -l
chmod 640 file.txt
chmod u+x script.sh
chown user:group file.txt
```

## Example output

```text
$ ls -l script.sh
-rwxr-xr-- 1 dev dev 420 script.sh
```

## Troubleshooting

- Script will not run: add execute permission (`chmod u+x script.sh`).
- Wrong owner/group after copy: reset with `chown` and `chgrp`.
- Unexpected defaults: check `umask`.
