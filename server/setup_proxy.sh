echo "Creating Docker network..."
docker network create dockernet

echo "Starting nginx-proxy..."
sudo docker run --name nginx-proxy \
    --net dockernet -p 80:80 -p 443:443 \
    -v ~/htpasswd:/etc/nginx/htpasswd \
    -v ~/certs:/etc/nginx/certs -v /etc/nginx/vhost.d -v /usr/share/nginx/html \
    -v /var/run/docker.sock:/tmp/docker.sock:ro \
    --label com.github.jrcs.letsencrypt_nginx_proxy_companion.nginx_proxy \
    -d --restart always jwilder/nginx-proxy

echo "Starting letsencrypt proxy companion..."
sudo docker run --name letsencrypt-nginx-proxy-companion \
    --net dockernet \
    -v ~/certs:/etc/nginx/certs:rw \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    --volumes-from nginx-proxy \
    -d --restart always jrcs/letsencrypt-nginx-proxy-companion
