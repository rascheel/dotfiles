sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get -y install build-essential

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
cp google.list /etc/apt/sources.list.d/
sudo apt-get -y update
sudo apt-get -y install google-chrome-stable

sudo apt-get -y install vim-gnome vim

sudo apt-get -y install xclip
