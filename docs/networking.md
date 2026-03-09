# Networking

## Core concepts

- Interface config controls addresses and routes.
- DNS resolves names to IPs.
- Listening ports expose services.

## Useful commands

```bash
ip a
ip route
ss -tuln
ping -c 3 8.8.8.8
```

## Example output

```text
$ ss -tuln
tcp LISTEN 0 128 0.0.0.0:22 0.0.0.0:*
```

## Troubleshooting

- `Network is unreachable`: verify default route with `ip route`.
- DNS failures: test resolver with `getent hosts example.com`.
- Port closed: verify service is listening and firewall permits access.
