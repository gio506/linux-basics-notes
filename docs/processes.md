# Processes

## Why it matters
Every running program is a process. Knowing process tools helps debugging.

## Useful commands
```bash
ps aux | head -n 10
pgrep -a ssh
top
```

## Signals
- `SIGTERM` (15): ask process to stop gracefully.
- `SIGKILL` (9): force stop.

```bash
kill <pid>
kill -9 <pid>
```

## Practical exercise
```bash
sleep 120 &
pgrep -a sleep
kill %1
```
