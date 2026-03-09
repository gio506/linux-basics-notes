# Processes

## Core concepts

- Every running program has a process ID (PID).
- Foreground processes attach to terminal; background processes do not.
- Prefer graceful termination before force kill.

## Useful commands

```bash
ps aux | head -n 10
pgrep -a ssh
top
kill <pid>
```

## Example output

```text
$ pgrep -a ssh
1280 /usr/sbin/sshd -D
```

## Troubleshooting

- Process restarts after kill: check service manager (`systemctl status`).
- High CPU: inspect with `top` then check logs for repeated errors.
- Zombie process suspicion: inspect parent process and service supervision.
