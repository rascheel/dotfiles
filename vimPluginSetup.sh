git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

tee --append ~/.vimrc < .vimrcPlugins

vim +BundleInstall +qall

cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer


