# Permissions

## Why it matters
Permissions protect files from unauthorized reads, writes, and execution.

## Permission model
Each file has permissions for:
- User (owner)
- Group
- Others

Symbols:
- `r` read
- `w` write
- `x` execute

## Useful commands
```bash
ls -l
chmod u+x script.sh
chmod 640 secret.txt
chown user:group file.txt
```

## Practical exercise
```bash
touch demo.txt
chmod 600 demo.txt
ls -l demo.txt
```
You should see only the owner can read/write.
