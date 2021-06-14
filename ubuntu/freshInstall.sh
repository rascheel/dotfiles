# Setup a fresh Ubuntu 20.04 install

sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get -y install build-essential

sudo apt-get -y install xclip

sudo apt-get -y install exuberant-ctags

sudo apt-get -y install tmux tmuxinator

# Neovim python dependencies
sudo apt-get -y install python3-pip
python3 -m pip install --user --upgrade pynvim

# Neovim powerline fonts
sudo apt-get -y install fonts-powerline

# Neovim build/installation
mkdir -p ~/git
cd ~/git
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
make CMAKE_BUILD_TYPE=Release
sudo make install

