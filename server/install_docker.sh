echo "Removing old versions of Docker if any..."
sudo apt-get remove docker docker-engine docker.io

echo "Updating system..."

sudo apt-get update && sudo apt-get upgrade

echo "Installing latest stable Docker release..."

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install docker-ce

echo "Adding current user to the docker user group..."
sudo usermod -aG docker $USER