# Linux Basics Notes

## 1) Filesystem

### Why it matters

The Linux filesystem is where everything lives: files, configs, logs, devices,
and executables.

### Core ideas

- `/` is the root directory.
- Absolute paths start with `/`.
- Relative paths start from your current directory.

### Important directories

- `/home` - user home directories.
- `/etc` - system-wide configuration.
- `/var/log` - logs.
- `/tmp` - temporary files.
- `/usr/bin` - common installed binaries.

### Commands

```bash
pwd
ls -lah
cd /etc
find . -maxdepth 2 -type d
```

### Practice

```bash
mkdir -p ~/lab/fs-demo
cd ~/lab/fs-demo
touch notes.txt
mkdir examples
mv notes.txt examples/
find . -maxdepth 2 -print
```

## 2) Permissions

### Why it matters

Permissions control read, write, and execute access.

### Model

Each file has permissions for:

- user (owner)
- group
- others

Permission symbols:

- `r` read
- `w` write
- `x` execute

### Commands

```bash
ls -l
chmod u+x script.sh
chmod 640 secret.txt
chown user:group file.txt
```

### Practice

```bash
touch demo.txt
chmod 600 demo.txt
ls -l demo.txt
```

## 3) Users and Groups

### Why it matters

Users and groups separate privileges and reduce risk.

### Commands

```bash
whoami
id
groups
getent passwd "$USER"
```

### Admin commands

```bash
sudo useradd -m trainee
sudo usermod -aG sudo trainee
sudo groupadd devops
```

### Practice

```bash
id
getent group sudo
```

## 4) Processes

### Why it matters

Every running program is a process.

### Commands

```bash
ps aux | head -n 10
pgrep -a ssh
top
```

### Signals

- `SIGTERM` (15): graceful stop.
- `SIGKILL` (9): force stop.

```bash
kill <pid>
kill -9 <pid>
```

### Practice

```bash
sleep 120 &
pgrep -a sleep
kill %1
```

## 5) Networking

### Why it matters

Linux networking basics are required for SSH, APIs, and troubleshooting.

### Commands

```bash
ip a
ip route
ss -tuln
ping -c 3 8.8.8.8
```

### DNS checks

```bash
getent hosts example.com
resolvectl status
```

### Practice

```bash
ss -tuln
ip route
```

## 6) systemd

### Why it matters

Most modern Linux systems use `systemd` for services.

### Commands

```bash
systemctl status ssh
systemctl list-units --type=service --state=running
systemctl is-enabled cron
```

### Debugging services

```bash
journalctl -u ssh -n 50 --no-pager
sudo systemctl restart ssh
```

### Practice

```bash
systemctl --failed
systemctl status NetworkManager || true
```

## 7) Logs

### Why it matters

Logs are the first place to investigate failures.

### Common log files

- `/var/log/syslog` (Debian/Ubuntu)
- `/var/log/messages` (RHEL-like systems)
- `/var/log/auth.log` (authentication events)

### Commands

```bash
journalctl -xe --no-pager
journalctl -u ssh -n 100 --no-pager
tail -f /var/log/syslog
```

### Practice

```bash
journalctl -n 20 --no-pager
sudo tail -n 20 /var/log/auth.log
```
