# glitch-trade-infra — Server Inventory (aws-glitchexecutor-new)

Single source of truth for what runs on this box. Hand-maintained — update
whenever you add, remove, enable, or disable something. Live machine state
is auto-captured daily in [SNAPSHOT.md](SNAPSHOT.md) (do not edit that one).

**Host:** AWS EC2 — 3.128.106.96 (`ssh aws-glitchexecutor-new`, login `ubuntu`) — account 774075583717, us-east-2, instance `i-0e266cb94127ae86e`. Migrated here 2026-06-24; the old `3.151.253.206` is NOT this box.
**Role:** Glitch Executor / Trade — prop-firm trading dashboard + admin platform. This box is Trade/GE only.
**Last reviewed:** 2026-07-31

---

## Quick status table

| Service | Port | Dir | Purpose |
|---|---|---|---|
| nginx | 80/443 | /etc/nginx | Reverse proxy for all public hosts |
| postgresql@18-main | 5432 (localhost) | — | Host Postgres (`glitch_trade`) |
| glitch-trade-api | (see nginx) | ~/glitch-trade-app | Trade API (app + API merged repo) |
| glitch-capi | — | — | Unified CAPI server |
| glitchexecutor-sso | — | /opt/glitchexecutor-sso | SSO auth service |
| docker: glitch-payment | 127.0.0.1:5002 | admin platform stack | Payment service |
| docker: glitch-admin-api | 127.0.0.1:5004→5003 | admin platform stack | Admin API |
| docker: glitch-postgres | 5432 (container) | admin platform stack | Admin-stack Postgres |
| docker: glitch-redis | 6379 (container) | admin platform stack | Admin-stack Redis |
| docker: glitch-docker-proxy | 2375 (container) | admin platform stack | Docker socket proxy |

## Public surface

| Host | Backend |
|---|---|
| trade-api.glitchexecutor.com | glitch-trade-api |
| sso.glitchexecutor.com | glitchexecutor-sso |
| admin-api.glitchexecutor.com | docker glitch-admin-api |

Full vhost configs are mirrored in [nginx/](nginx/); systemd units
(secrets redacted) in [systemd/](systemd/).

## Databases

- Host Postgres 18: `glitch_trade`. Nightly backup `~/backups/backup-host-postgres.sh` (03:00 UTC).
- Docker Postgres (admin stack). Nightly backup `~/backups/backup-docker-postgres.sh` (03:30 UTC).

## Operational cheatsheet

```bash
systemctl list-units --type=service --state=running | grep -E "glitch|trade|sso"
systemctl --failed
docker ps
sudo ss -tlnp
sudo nginx -t && sudo systemctl reload nginx
journalctl -u <name> -f
```

For infra topology detail see `docs/INFRA_TOPOLOGY.md` in `glitch-trade-app`.

## How this repo stays current

- `snapshot.sh` regenerates SNAPSHOT.md and re-mirrors nginx/systemd/cron
  configs from the live system.
- `sync.sh` (daily cron, 03:47 UTC) runs the snapshot, commits any drift,
  and pushes to both mirrors (GitHub `Nuraveda-Labs/glitch-trade-infra`,
  GitLab `nuraveda-lab/glitch-trade-infra`).
- This README is the only hand-edited file: when you add/remove/change a
  service, update the tables above and bump **Last reviewed**.
