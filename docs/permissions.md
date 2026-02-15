# Permissions

## Permission model
Linux permissions are split into:
- **u**: user (owner)
- **g**: group
- **o**: others

Permission bits:
- `r` (read)
- `w` (write)
- `x` (execute)

Example:
```bash
-rwxr-x---
```
Owner can read/write/execute, group can read/execute, others have no access.

## Key commands
```bash
ls -l file
chmod 750 script.sh
chmod u+x script.sh
chown alice:devops file
chgrp developers file
umask 022
```

## Troubleshooting checklist
1. Verify owner/group: `ls -l`.
2. Verify execute bit for scripts/binaries.
3. Confirm parent directory execute bit (`x`) for traversal.
