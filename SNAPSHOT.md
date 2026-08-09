# Server Snapshot — aws-glitchexecutor (3.151.253.206)

**Auto-generated — do not edit.** Regenerated daily by `snapshot.sh` (committed by `sync.sh`).
Hand-maintained notes live in [README.md](README.md).

**Generated:** 2026-08-09 03:47:01 UTC
**Uptime:** up 6 weeks, 4 days, 2 hours, 14 minutes
**Load avg:** 0.79, 1.88, 3.07

## Running services (ours)

```
  glitch-capi.service                            loaded active running Glitch Executor Unified CAPI Server
  glitch-trade-api.service                       loaded active running Glitch Trade API (FastAPI) — FundingPips Zero progress dashboard
  glitchexecutor-sso.service                     loaded active running Glitch Executor SSO Authentication Service
```

## Inactive / stopped (ours)

```
(none)
```

## Failed services

```
(none)
```

## Docker containers

```
NAMES                 IMAGE                           STATUS                 PORTS
glitch-payment        glitchexecutor-payment          Up 8 days (healthy)    127.0.0.1:5002->5002/tcp
glitch-admin-api      glitchexecutor-admin_api        Up 6 weeks (healthy)   127.0.0.1:5004->5003/tcp
glitch-postgres       postgres:16-alpine              Up 6 weeks (healthy)   5432/tcp
glitch-docker-proxy   tecnativa/docker-socket-proxy   Up 6 weeks             2375/tcp
glitch-redis          redis:7-alpine                  Up 6 weeks (healthy)   6379/tcp
```

## Listening ports

```
0.0.0.0:19999                proc=netdata
0.0.0.0:22                   proc=sshd
0.0.0.0:443                  proc=nginx
0.0.0.0:80                   proc=nginx
127.0.0.1:14737              proc=code-1b6a188127
127.0.0.1:23325              proc=containerd
127.0.0.1:3112               proc=python
127.0.0.1:4317               proc=otel-plugin
127.0.0.1:5001               proc=python3
127.0.0.1:5002               proc=docker-proxy
127.0.0.1:5004               proc=docker-proxy
127.0.0.1:5432               proc=postgres
127.0.0.1:6000               proc=gunicorn
127.0.0.1:8125               proc=netdata
127.0.0.53%lo:53             proc=systemd-resolve
127.0.0.54:53                proc=systemd-resolve
[::]:19999                   proc=netdata
[::]:22                      proc=sshd
[::]:443                     proc=nginx
[::]:80                      proc=nginx
```

## Nginx sites enabled

```
admin-api.glitchexecutor.com
dev.glitchexecutor.com
sso.glitchexecutor.com
trade-api.glitchexecutor.com
```

## TLS certificates

```
  Certificate Name: dev.glitchexecutor.com
    Domains: *.dev.glitchexecutor.com
    Expiry Date: 2026-11-06 01:02:36+00:00 (VALID: 88 days)
  Certificate Name: sso.glitchexecutor.com
    Domains: sso.glitchexecutor.com admin-api.glitchexecutor.com trade-api.glitchexecutor.com
    Expiry Date: 2026-09-22 02:00:37+00:00 (VALID: 43 days)
```

## Postgres databases

```
glitch_trade  (112 MB)
postgres  (7678 kB)
sso  (8414 kB)
```

## Disk

```
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        48G   36G   12G  76% /
```

## Memory

```
               total        used        free      shared  buff/cache   available
Mem:           3.7Gi       2.3Gi       133Mi       125Mi       1.7Gi       1.4Gi
Swap:          2.0Gi       1.0Gi       992Mi
```

## Project directories

```
/home/ubuntu/.agents                           (not a git repo)
/home/ubuntu/.android                          (not a git repo)
/home/ubuntu/.app-store                        (not a git repo)
/home/ubuntu/.appstoreconnect                  (not a git repo)
/home/ubuntu/.aws                              (not a git repo)
/home/ubuntu/.cache                            (not a git repo)
/home/ubuntu/.claude                           (not a git repo)
/home/ubuntu/.cloakbrowser                     (not a git repo)
/home/ubuntu/.codegraph                        (not a git repo)
/home/ubuntu/.codex                            (not a git repo)
/home/ubuntu/.config                           (not a git repo)
/home/ubuntu/.copilot                          (not a git repo)
/home/ubuntu/.cursor                           (not a git repo)
/home/ubuntu/.cursor-server                    (not a git repo)
/home/ubuntu/.docker                           (not a git repo)
/home/ubuntu/.dotnet                           (not a git repo)
/home/ubuntu/.expo                             (not a git repo)
/home/ubuntu/.gnupg                            (not a git repo)
/home/ubuntu/.gradle                           (not a git repo)
/home/ubuntu/.gunicorn                         (not a git repo)
/home/ubuntu/.impeccable                       (not a git repo)
/home/ubuntu/.kimi-code                        (not a git repo)
/home/ubuntu/.local                            (not a git repo)
/home/ubuntu/.npm                              (not a git repo)
/home/ubuntu/.sentry                           (not a git repo)
/home/ubuntu/.ssh                              (not a git repo)
/home/ubuntu/.strix                            (not a git repo)
/home/ubuntu/.terraform.d                      (not a git repo)
/home/ubuntu/.vscode-server                    (not a git repo)
/home/ubuntu/admin-api-boxless                 (not a git repo)
/home/ubuntu/backups                           (not a git repo)
/home/ubuntu/capi-boxless                      (not a git repo)
/home/ubuntu/decommission-backup-oldbox        (not a git repo)
/home/ubuntu/glitch-trade-app                  git: git@github.com:Nuraveda-Labs/glitch-trade-app.git
/home/ubuntu/glitch-trade-core                 git: git@github.com:Nuraveda-Labs/glitch-trade-core.git
/home/ubuntu/glitch-trade-docs                 git: git@github.com:Nuraveda-Labs/glitch-trade-docs.git
/home/ubuntu/glitch-trade-infra                git: git@github.com:Nuraveda-Labs/glitch-trade-infra.git
/home/ubuntu/google-oauth                      (not a git repo)
/home/ubuntu/keystores                         (not a git repo)
/home/ubuntu/payment-boxless                   (not a git repo)
/home/ubuntu/sso-boxless                       (not a git repo)
/home/ubuntu/sso-pg-port                       git: git@github.com:floating-astronaut/glitchexecutor-sso.git
/home/ubuntu/tools                             (not a git repo)
/home/ubuntu/worktrees                         (not a git repo)

```

## Crontab (ubuntu)

```
0 3 * * * /home/ubuntu/backups/backup-host-postgres.sh
30 3 * * * /home/ubuntu/backups/backup-docker-postgres.sh
47 3 * * * cd /home/ubuntu/glitch-trade-infra && bash sync.sh >> /home/ubuntu/glitch-trade-infra/sync.log 2>&1
```
