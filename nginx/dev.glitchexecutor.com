# DEV/staging hostnames on this box (774, GE DEV) — box-less prod plan §2a.
# These proxy to the SAME local services as the root hosts (one env on the box
# during the transition); when box-less prod takes over the root hosts, the box
# keeps only these *.dev names.
map $host $dev_backend {
    trade-api.dev.glitchexecutor.com  127.0.0.1:3112;
    sso.dev.glitchexecutor.com        127.0.0.1:6000;
    admin-api.dev.glitchexecutor.com  127.0.0.1:5004;
}
server {
    listen 80; listen [::]:80;
    server_name trade-api.dev.glitchexecutor.com sso.dev.glitchexecutor.com admin-api.dev.glitchexecutor.com;
    location / { return 301 https://$host$request_uri; }
}
server {
    listen 443 ssl; http2 on;
    listen [::]:443 ssl;
    server_name trade-api.dev.glitchexecutor.com sso.dev.glitchexecutor.com admin-api.dev.glitchexecutor.com;

    ssl_certificate     /etc/letsencrypt/live/dev.glitchexecutor.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/dev.glitchexecutor.com/privkey.pem;
    add_header Strict-Transport-Security "max-age=63072000" always;
    add_header X-Environment "dev" always;

    access_log /var/log/nginx/dev.access.log;
    error_log  /var/log/nginx/dev.error.log;
    client_max_body_size 2m;

    location / {
        proxy_pass         http://$dev_backend;
        proxy_http_version 1.1;
        proxy_set_header   Host              $host;
        proxy_set_header   X-Real-IP         $remote_addr;
        proxy_set_header   X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header   X-Forwarded-Proto $scheme;
        proxy_set_header   Cookie            $http_cookie;
        proxy_read_timeout 30s;
    }
}
