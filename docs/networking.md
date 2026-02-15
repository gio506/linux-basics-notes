# Networking

## Core checks
```bash
ip a
ip route
ss -tulpen
ping -c 4 8.8.8.8
curl -I https://example.com
```

## DNS checks
```bash
cat /etc/resolv.conf
getent hosts example.com
nslookup example.com
```

## Troubleshooting flow
1. Confirm interface/IP: `ip a`.
2. Confirm default route: `ip route`.
3. Check DNS resolution.
4. Verify service is listening: `ss -tulpen`.
5. Test connectivity end-to-end with `curl`/`ping`.
