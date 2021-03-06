# Setup a fresh Ubuntu 20.04 install

sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get -y install build-essential

sudo apt-get -y install xclip

# Tools I like
sudo apt-get -y install tmux tmuxinator tree exuberant-ctags ripgrep

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

# Install neovim plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall +qall

# Install build dependencies
sudo apt-get -y install libncurses5-dev gcc make git exuberant-ctags bc libssl-dev

# Documentation tools
sudo apt-get -y install sphinxsearch python3-docutils python3-sphinx python3-sphinx-rtd-theme graphviz imagemagick texlive-latex-recommended texlive-base 
