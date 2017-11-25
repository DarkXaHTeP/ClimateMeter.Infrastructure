echo "Starting portainer..."
sudo docker run --name portainer \
    --net dockernet \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer:/data \
    -e VIRTUAL_HOST=docker.darkxahtep.co.ua \
    -e VIRTUAL_PORT=9000 \
    -e LETSENCRYPT_HOST=docker.darkxahtep.co.ua \
    -e LETSENCRYPT_EMAIL=darkxahtep@gmail.com \
    --restart always -d portainer/portainer