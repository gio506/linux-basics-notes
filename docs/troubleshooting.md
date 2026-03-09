# Troubleshooting Playbook

## 5-step triage flow

1. Define symptom and scope (`what`, `when`, `who`, `where`).
2. Confirm recent changes (deploy, package updates, config edits).
3. Collect read-only evidence (status, logs, metrics, open ports).
4. Form one hypothesis at a time and test safely.
5. Record root cause and preventive action.

## Quick checks by area

- Filesystem: `df -h`, `du -sh /var/*`, `ls -l`.
- Permissions: `namei -l /path/to/file`, `id`, `umask`.
- Processes: `ps aux`, `pgrep -a <name>`, `top`.
- Networking: `ip a`, `ip route`, `ss -tuln`, `ping`.
- systemd/logs: `systemctl status <unit>`, `journalctl -u <unit> -n 100`.

## Incident notes template

```text
Symptom:
Start time:
Affected hosts/users:
Evidence:
Root cause:
Fix applied:
Follow-up action:
```
