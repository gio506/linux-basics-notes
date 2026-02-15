# Linux quick cheatsheet

A quick lookup for **what command to use for what task**.

| Task | Command | What it's for |
|---|---|---|
| Show current directory | `pwd` | Confirms where you are |
| List files with details | `ls -lah` | Shows hidden files, sizes, permissions |
| Find files by name | `find . -name "*.log"` | Searches directory trees |
| Check disk usage | `du -sh *` | Shows size per item in current directory |
| Check free disk space | `df -h` | Shows filesystem usage summary |
| Show file permissions | `ls -l` | Displays owner/group/mode bits |
| Change permissions | `chmod 750 file` | Sets read/write/execute bits |
| Change ownership | `chown user:group file` | Reassigns owner and group |
| Show running processes | `ps -ef` | Lists process table |
| Live process monitor | `top` | Real-time CPU and memory view |
| Find process by name | `pgrep <name>` | Returns matching PID(s) |
| Show network interfaces | `ip a` | Displays IP and link status |
| Show listening ports | `ss -tulpen` | Displays open ports and PIDs |
| Check service status | `systemctl status <svc>` | Shows service health and logs |
| View service logs | `journalctl -u <svc> -f` | Tails logs for one systemd unit |
