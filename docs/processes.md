# Processes

## Process basics
- A process is a running program instance.
- Each process has a PID and parent PID.
- Foreground jobs attach to terminal; background jobs do not.

## Common commands
```bash
ps aux | head
ps -ef
pgrep sshd
top
htop
kill <pid>
kill -15 <pid>   # graceful
kill -9 <pid>    # force (last resort)
```

## Job control
```bash
sleep 300 &   # run in background
jobs          # show jobs
fg %1         # bring job 1 to foreground
bg %1         # continue job in background
```
