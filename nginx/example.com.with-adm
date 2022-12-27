server {
       listen 80;
       listen [::]:80;

       server_name example.com;

       root /var/www/example.com;
       index index.html;

       location / {
               try_files $uri $uri/ =404;
       }
       location /__tadm {
               proxy_pass   http://localhost:8090/;
       }
       location ~* ^/(static|common|auth|trojan)/ {
               proxy_pass  http://localhost:8090;
               proxy_http_version 1.1;
               proxy_set_header Upgrade $http_upgrade;
               proxy_set_header Connection "Upgrade";
               proxy_set_header Host $host;
       }
       if ( $remote_addr != 127.0.0.1 ){
               rewrite ^/(.*)$ https://example.com/$1 redirect;
       }
}

