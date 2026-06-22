# Server Snapshot — aws-glitchexecutor (3.151.253.206)

**Auto-generated — do not edit.** Regenerated daily by `snapshot.sh` (committed by `sync.sh`).
Hand-maintained notes live in [README.md](README.md).

**Generated:** 2026-06-22 03:47:02 UTC
**Uptime:** up 2 weeks, 1 day, 4 hours, 44 minutes
**Load avg:** 3.96, 3.13, 2.11

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
glitch-payment        glitchexecutor-payment          Up 9 days (healthy)    127.0.0.1:5002->5002/tcp
glitch-admin-api      glitchexecutor-admin_api        Up 2 weeks (healthy)   127.0.0.1:5004->5003/tcp
glitch-postgres       postgres:16-alpine              Up 2 weeks (healthy)   5432/tcp
glitch-redis          redis:7-alpine                  Up 2 weeks (healthy)   6379/tcp
glitch-docker-proxy   tecnativa/docker-socket-proxy   Up 2 weeks             2375/tcp
```

## Listening ports

```
0.0.0.0:22                   proc=sshd
0.0.0.0:25                   proc=master
0.0.0.0:443                  proc=nginx
0.0.0.0:80                   proc=nginx
127.0.0.1:19999              proc=netdata
127.0.0.1:3112               proc=python
127.0.0.1:35035              proc=containerd
127.0.0.1:4317               proc=otel-plugin
127.0.0.1:5001               proc=python3
127.0.0.1:5002               proc=docker-proxy
127.0.0.1:5004               proc=docker-proxy
127.0.0.1:5432               proc=postgres
127.0.0.1:6000               proc=gunicorn
127.0.0.1:8125               proc=netdata
127.0.0.53%lo:53             proc=systemd-resolve
127.0.0.54:53                proc=systemd-resolve
[::]:22                      proc=sshd
[::]:25                      proc=master
[::]:443                     proc=nginx
[::]:80                      proc=nginx
```

## Nginx sites enabled

```
admin-api.glitchexecutor.com
sso.glitchexecutor.com
trade-api.glitchexecutor.com
```

## TLS certificates

```
  Certificate Name: sso.glitchexecutor.com
    Domains: sso.glitchexecutor.com admin-api.glitchexecutor.com trade-api.glitchexecutor.com
    Expiry Date: 2026-09-05 01:39:03+00:00 (VALID: 74 days)
```

## Postgres databases

```
glitch_trade  (43 MB)
postgres  (7678 kB)
```

## Disk

```
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        48G   14G   34G  29% /
```

## Memory

```
               total        used        free      shared  buff/cache   available
Mem:           3.8Gi       2.0Gi       213Mi       101Mi       2.0Gi       1.8Gi
Swap:          2.0Gi       475Mi       1.5Gi
```

## Project directories

```
/home/ubuntu/.cache                            (not a git repo)
/home/ubuntu/.claude                           (not a git repo)
/home/ubuntu/.config                           (not a git repo)
/home/ubuntu/.gunicorn                         (not a git repo)
/home/ubuntu/.kimi                             (not a git repo)
/home/ubuntu/.kimi-code                        (not a git repo)
/home/ubuntu/.local                            (not a git repo)
/home/ubuntu/.ssh                              (not a git repo)
/home/ubuntu/backups                           (not a git repo)
/home/ubuntu/glitch-trade-app                  git: git@github.com:Nuraveda-Labs/glitch-trade-app.git
/home/ubuntu/glitch-trade-core                 git: git@github.com:Nuraveda-Labs/glitch-trade-core.git
/home/ubuntu/glitch-trade-infra                git: git@github.com:Nuraveda-Labs/glitch-trade-infra.git
/home/ubuntu/snap                              (not a git repo)

```

## Crontab (ubuntu)

```
0 3 * * * /home/ubuntu/backups/backup-host-postgres.sh
30 3 * * * /home/ubuntu/backups/backup-docker-postgres.sh
47 3 * * * cd /home/ubuntu/glitch-trade-infra && bash sync.sh >> /home/ubuntu/glitch-trade-infra/sync.log 2>&1
```
