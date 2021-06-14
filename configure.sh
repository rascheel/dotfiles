mkdir -p ~/.config/nvim
ln -s ~/git/dotfiles/init.vim ~/.config/nvim/init.vim

tee --append ~/.bashrc < ~/git/dotfiles/alias
echo ".bashrc modified, restart terminal (or source .bashrc)"
