# Filesystem basics

## Core ideas
- Linux uses a single directory tree rooted at `/`.
- Everything is treated as a file (regular files, devices, sockets).
- Paths can be absolute (`/var/log/syslog`) or relative (`./notes.txt`).

## Important directories
- `/home`: user home directories.
- `/etc`: system configuration.
- `/var`: variable data (logs, spool, cache).
- `/tmp`: temporary files.
- `/usr`: userland binaries and shared data.
- `/bin` and `/sbin`: essential commands.

## Essential commands
```bash
pwd           # print current directory
ls -lah       # list files with details
cd /path      # change directory
mkdir notes   # create directory
touch file    # create empty file
cp a b        # copy
mv a b        # move/rename
rm file       # remove file (careful)
find . -name '*.log'
du -sh *      # size summary per item
```

## Practical tips
- Use `tab` completion to reduce typos.
- Prefer `mv old new` to rename safely.
- Check current path with `pwd` before destructive commands.
