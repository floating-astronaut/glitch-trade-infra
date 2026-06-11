server {
    listen 80;
    listen [::]:80;
    server_name sso.glitchexecutor.com;
    location = /login { limit_req zone=auth burst=5 nodelay; proxy_pass http://127.0.0.1:6000; }
    location / { return 301 https://$host$request_uri; }
}
server {
    listen 443 ssl;
    listen [::]:443 ssl;
    http2 on;
    server_name sso.glitchexecutor.com;

    ssl_certificate     /etc/letsencrypt/live/sso.glitchexecutor.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/sso.glitchexecutor.com/privkey.pem;
    add_header Strict-Transport-Security "max-age=63072000" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header Referrer-Policy "strict-origin-when-cross-origin" always;

    access_log /var/log/nginx/sso.access.log;
    error_log  /var/log/nginx/sso.error.log;

    client_max_body_size 1m;

    location = /login { limit_req zone=auth burst=5 nodelay; proxy_pass http://127.0.0.1:6000; }
    location / {
        proxy_pass http://127.0.0.1:6000;
        proxy_http_version 1.1;
        proxy_set_header Host              $host;
        proxy_set_header X-Real-IP         $remote_addr;
        proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Forwarded-Host  $host;
        proxy_read_timeout 30s;
        proxy_connect_timeout 5s;
    }
}
