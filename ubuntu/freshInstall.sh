### Setup a fresh Ubuntu 22.04 install ###
### APT Packages ###
sudo apt -y update
sudo apt -y upgrade

PACKAGES="build-essential"
PACKAGES+=" xclip"

# Tools I like
PACKAGES+=" tmux tmuxinator tree exuberant-ctags ripgrep curl htop steam gimp gimp-plugin-registry gnome-clocks openvpn p7zip-full meld picocom curl chrome-gnome-shell gnome-shell-pomodoro ranger s-tui gparted progress"

# Install build dependencies
PACKAGES+=" libncurses5-dev gcc make git exuberant-ctags bc libssl-dev bison flex"

# Install bitbake dependencies
PACKAGES+=" zstd gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio python python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping libsdl1.2-dev xterm"

# Install appimage dependencies
PACKAGES+=" fuse libfuse2"

# Install work repos
PACKAGES+=" bmap-tools minicom device-tree-compiler pidgin isc-dhcp-server libusb-1.0-0-dev wine64 filezilla"

# Documentation tools
PACKAGES+=" sphinxsearch python3-docutils python3-sphinx python3-sphinx-rtd-theme graphviz imagemagick texlive-latex-recommended texlive-base"

# Pygame for fun
PACKAGES+=" python3-pygame"

# Required for background switcher script
PACKAGES+=" libglib2.0-dev-bin"

# Required for system monitor gnome extension "vitals"
PACKAGES+=" gir1.2-gtop-2.0 lm-sensors"

# Install packages
sudo apt -y install $PACKAGES

### Install Snaps I use ###
SNAPS="signal-desktop discord spotify vlc mdview"
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
mkdir -p ~/git/personal/neovim
cd ~/git/personal
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=Release
sudo make install

# Disable lockscreen notifications (I think this is waking up my monitor when it is supposed to be suspended)
gsettings set org.gnome.desktop.notifications show-in-lock-screen false
