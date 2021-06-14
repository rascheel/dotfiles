mkdir -p ~/.config/nvim
cp ~/git/dotfiles/init.vim ~/.config/nvim/

tee --append ~/.bashrc < ~/git/dotfiles/alias
