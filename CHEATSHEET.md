# Linux Basics Cheatsheet

Quick command map: what to use, and when to use it.

## Filesystem and navigation

- `pwd` - print current directory.
- `ls -lah` - list files with hidden entries and sizes.
- `tree -L 2` - show directory tree (if installed).
- `cd /path` - change directory.
- `mkdir -p dir/subdir` - create nested directories.
- `cp -r src dst` - copy files/directories.
- `mv src dst` - move or rename.
- `rm -i file` - remove with confirmation.
- `find . -type f -name "*.log"` - find matching files.
- `du -sh *` - show directory sizes.
- `df -h` - show filesystem free space.

## File content and text tools

- `cat file` - print full file.
- `less file` - view file page by page.
- `head -n 20 file` - top lines.
- `tail -n 50 file` - last lines.
- `tail -f file` - follow file in real time.
- `wc -l file` - line count.
- `sort file | uniq -c` - count unique lines.
- `cut -d: -f1 /etc/passwd` - extract first field.
- `awk '{print $1}' file` - print first column.
- `sed 's/old/new/g' file` - replace text preview.

## Permissions and ownership

- `ls -l` - inspect mode/owner/group.
- `chmod 640 file` - set rw-r-----.
- `chmod u+x script.sh` - add execute for owner.
- `chown user:group file` - change owner and group.
- `chgrp group file` - change group only.
- `umask` - view default permission mask.

## Users and groups

- `whoami` - current user.
- `id` - UID/GID and groups.
- `groups` - group memberships.
- `getent passwd username` - account entry lookup.
- `sudo -l` - list allowed sudo commands.

## Processes and jobs

- `ps aux` - snapshot all processes.
- `top` / `htop` - live process monitor.
- `pgrep -a nginx` - find process by name.
- `kill <pid>` - graceful stop.
- `kill -9 <pid>` - force stop.
- `jobs` - shell background jobs.
- `bg` / `fg` - move jobs to background/foreground.
- `nohup cmd &` - keep process running after logout.

## Networking

- `ip a` - interfaces and addresses.
- `ip route` - routing table.
- `ss -tuln` - listening ports.
- `ping -c 3 8.8.8.8` - quick connectivity test.
- `curl -I https://example.com` - check HTTP response headers.
- `dig example.com` or `nslookup example.com` - DNS lookup.

## Services and logs

- `systemctl status ssh` - service status.
- `systemctl restart ssh` - restart service.
- `systemctl enable service` - start on boot.
- `journalctl -u ssh -n 50 --no-pager` - recent unit logs.
- `journalctl -xe --no-pager` - recent errors and context.

## Archive and transfer

- `tar -czf backup.tar.gz folder/` - create compressed archive.
- `tar -xzf backup.tar.gz` - extract archive.
- `scp file user@host:/path/` - secure copy to remote host.
- `rsync -avh src/ dst/` - efficient sync.

## Safety habits

- Start with read-only inspection commands (`ls`, `ps`, `ss`, `journalctl`).
- Validate target path before `rm`, `mv`, `chown`, or `chmod`.
- Prefer `cp` backup before editing important config files.
