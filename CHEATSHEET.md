# Linux Top 30 Commands (with examples)

1. `pwd` - show current directory. Example: `pwd`
2. `ls -lah` - list files with details. Example: `ls -lah /etc`
3. `cd` - change directory. Example: `cd /var/log`
4. `mkdir -p` - create nested folders. Example: `mkdir -p ~/lab/demo`
5. `touch` - create empty file. Example: `touch notes.txt`
6. `cp -r` - copy files/directories. Example: `cp -r src/ backup/`
7. `mv` - move/rename. Example: `mv old.txt new.txt`
8. `rm -i` - remove with confirmation. Example: `rm -i temp.txt`
9. `find` - locate files. Example: `find . -type f -name '*.log'`
10. `du -sh` - directory size summary. Example: `du -sh /var/log`
11. `df -h` - filesystem usage. Example: `df -h`
12. `cat` - print full file. Example: `cat /etc/os-release`
13. `less` - page through file. Example: `less /var/log/syslog`
14. `head -n` - first lines. Example: `head -n 20 file.txt`
15. `tail -f` - follow file updates. Example: `tail -f /var/log/auth.log`
16. `grep` - search text. Example: `grep -i error app.log`
17. `awk` - column processing. Example: `awk '{print $1}' file.txt`
18. `sed` - stream edit. Example: `sed 's/http/https/g' config.txt`
19. `chmod` - change permission bits. Example: `chmod 640 secret.txt`
20. `chown` - change ownership. Example: `sudo chown dev:dev notes.txt`
21. `id` - show UID/GID/groups. Example: `id`
22. `ps aux` - process snapshot. Example: `ps aux | head`
23. `pgrep -a` - find process by name. Example: `pgrep -a ssh`
24. `kill` - send signal. Example: `kill 1234`
25. `ip a` - interface addresses. Example: `ip a`
26. `ip route` - routing table. Example: `ip route`
27. `ss -tuln` - listening ports. Example: `ss -tuln`
28. `ping -c 3` - connectivity test. Example: `ping -c 3 8.8.8.8`
29. `systemctl status` - service state. Example: `systemctl status ssh`
30. `journalctl -u` - unit logs. Example: `journalctl -u ssh -n 50 --no-pager`
