# Setup vim config
mkdir -p ~/.config/nvim
ln -s ~/git/dotfiles/init.vim ~/.config/nvim/init.vim

# Setup tmux config
ln -s ~/git/dotfiles/tmux.conf ~/.tmux.conf
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack

# Install neovim plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall +qall

# Add aliases
tee --append ~/.bashrc < ~/git/dotfiles/alias
echo ".bashrc modified, restart terminal (or source .bashrc)"
