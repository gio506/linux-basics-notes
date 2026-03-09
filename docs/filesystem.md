# Filesystem

## Core concepts

- `/` is the root of the filesystem.
- Absolute paths start with `/`; relative paths start from `pwd`.
- Linux treats nearly everything as a file (regular files, devices, sockets).

## Useful commands

```bash
pwd
ls -lah
find . -maxdepth 2 -type d
du -sh ./*
```

## Example output

```text
$ pwd
/home/dev/lab
$ ls -lah
-rw-r--r-- 1 dev dev  120 notes.txt
drwxr-xr-x 2 dev dev 4096 samples
```

## Troubleshooting

- `No such file or directory`: verify path spelling and case.
- `Permission denied`: inspect mode with `ls -l` and owner with `stat`.
- Disk full: use `df -h` and `du -sh /var/*` to locate heavy directories.
