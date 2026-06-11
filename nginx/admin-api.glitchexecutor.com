server {
    listen 80; listen [::]:80;
    server_name admin-api.glitchexecutor.com;
    location ~ ^/(openapi.json|docs|redoc)$ { return 404; access_log off; }
    location / { return 301 https://$host$request_uri; }
}
server {
    listen 443 ssl;
    http2 on;
    server_name admin-api.glitchexecutor.com;
    ssl_certificate     /etc/letsencrypt/live/sso.glitchexecutor.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/sso.glitchexecutor.com/privkey.pem;
    add_header Strict-Transport-Security "max-age=63072000" always;

    access_log /var/log/nginx/admin-api.access.log;
    error_log  /var/log/nginx/admin-api.error.log;

    location ~ ^/(openapi.json|docs|redoc)$ { return 404; access_log off; }
    location / {
        proxy_pass         http://127.0.0.1:5004;
        proxy_http_version 1.1;
        proxy_set_header   Host              $host;
        proxy_set_header   X-Real-IP         $remote_addr;
        proxy_set_header   X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header   X-Forwarded-Proto $scheme;
        proxy_set_header   Upgrade           $http_upgrade;
        proxy_set_header   Connection        "upgrade";
        proxy_read_timeout 3600s;
        proxy_send_timeout 3600s;
    }
}
