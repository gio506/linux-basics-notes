# Networking

## Why it matters
Networking basics are essential for SSH, web apps, and troubleshooting.

## Useful commands
```bash
ip a
ip route
ss -tuln
ping -c 3 8.8.8.8
```

## DNS checks
```bash
getent hosts example.com
resolvectl status
```

## Practical exercise
```bash
ss -tuln
ip route
```
Identify listening services and your default route.
