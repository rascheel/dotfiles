### Setup a fresh Ubuntu 22.04 install ###
### APT Packages ###
sudo apt -y update
sudo apt -y upgrade

PACKAGES="build-essential"
PACKAGES+=" xclip"

# Tools I like
PACKAGES+=" tmux tmuxinator tree exuberant-ctags ripgrep curl htop steam gimp gimp-plugin-registry"

# Install build dependencies
PACKAGES+=" libncurses5-dev gcc make git exuberant-ctags bc libssl-dev"

# Documentation tools
PACKAGES+=" sphinxsearch python3-docutils python3-sphinx python3-sphinx-rtd-theme graphviz imagemagick texlive-latex-recommended texlive-base"

# Pygame for fun
PACKAGES+=" python3-pygame"

# Install packages
sudo apt -y install $PACKAGES

### Install Snaps I use ###
SNAPS="signal-desktop discord spotify"
sudo snap install $SNAPS

### SETUP NEOVIM ###
# Neovim python dependencies
NVIM_PACKAGES=" python3-pip"

# Neovim powerline fonts
NVIM_PACKAGES+=" fonts-powerline"

# nvim build dependencies
NVIM_PACKAGES+=" ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip"

# Install nvim packages
sudo apt -y install $NVIM_PACKAGES

# Neovim python dependencies
python3 -m pip install --user --upgrade pynvim

# Neovim build/installation
mkdir -p ~/git
cd ~/git
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=Release
sudo make install
