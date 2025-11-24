# Setup vim config
mkdir -p ~/.config/nvim
ln -s ~/git/personal/dotfiles/init.vim ~/.config/nvim/init.vim

# Setup tmux config
ln -s ~/git/personal/dotfiles/tmux.conf ~/.tmux.conf
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack

# Install neovim plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall +qall

# Add aliases
tee --append ~/.bashrc < ~/git/personal/dotfiles/alias
echo ".bashrc modified, restart terminal (or source .bashrc)"

# Add fish config to dotfiles repo
rm -f ~/.config/fish/config.fish
mkdir -p ~/.config/fish/
ln -s ~/git/personal/dotfiles/config.fish ~/.config/fish/config.fish

# Make fish default shell
chsh -s /usr/bin/fish

# Echo warning about neovim
echo "WARNING: There is a bug in powerfonts with the default terminal font Ubuntu Mono Sans. Change terminal font settings to Ubuntu Mono. https://github.com/powerline/powerline/issues/2264"
