sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get -y install build-essential

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
cp google.list /etc/apt/sources.list.d/
sudo apt-get -y update
sudo apt-get -y install google-chrome-stable

# Current version of vim that ships with apt-get is too old, need to compile ourself.
# Once version gets updated to above version 7.3.584 can stop doing this
# Install required preq libraries for compiling vim
sudo apt-get -y install libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial
# remove old versions of vim
sudo apt-get -y remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common
# download source for vim
cd ~
hg clone https://code.google.com/p/vim
cd vim
# Compile vim source
./configure --with-features=huge \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-perlinterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
# install vim source
make VIMRUNTIMEDIR=/usr/share/vim/vim74
sudo make install
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim
# Done installing vim

sudo apt-get -y install xclip

#sudo apt-add-repository -y ppa:ehoover/compholio
#sudo apt-get -y update
#sudo apt-get -y install netflix-desktop

sudo apt-get -y install cmake python-dev

sudo apt-get -y install pyflakes
sudo apt-get -y install exuberant-ctags
