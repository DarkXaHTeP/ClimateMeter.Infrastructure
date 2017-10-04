echo "Installing apache2-utils..."
sudo apt-get install apache2-utils

echo "Generating basic auth credentials..."
mkdir ~/htpasswd
echo "Please type the username and press [Enter]:"
read USER_NAME
htpasswd -c ~/htpasswd/consul.darkxahtep.co.ua $USER_NAME

echo "Starting consul container..."
sudo docker run --name consul \
    --net dockernet \
    -v consul:/consul/data \
    -e CONSUL_LOCAL_CONFIG='{"bootstrap": true, "server": true, "ui": true}' \
    -e VIRTUAL_HOST=consul.darkxahtep.co.ua \
    -e VIRTUAL_PORT=8500 \
    -e LETSENCRYPT_HOST=consul.darkxahtep.co.ua \
    -e LETSENCRYPT_EMAIL=darkxahtep@gmail.com \
    -e LETSENCRYPT_TEST=true \
    --restart always -d \
    consul agent -server -bind 127.0.0.1 -client 0.0.0.0