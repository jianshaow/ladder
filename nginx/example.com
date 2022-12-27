server {
       listen 80;
       listen [::]:80;

       server_name example.com;

       root /var/www/example.com;
       index index.html;

       location / {
               try_files $uri $uri/ =404;
       }

       if ( $remote_addr != 127.0.0.1 ){
               rewrite ^/(.*)$ https://example.com/$1 redirect;
       }
}

