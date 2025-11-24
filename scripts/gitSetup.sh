mkdir -p ~/git/personal
mkdir -p ~/git/work
ln -s ~/git/personal/dotfiles/gitconfig ~/.gitconfig
ln -s ~/git/personal/dotfiles/gitconfig-personal ~/git/personal/.gitconfig
ln -s ~/git/personal/dotfiles/gitconfig-work ~/git/work/.gitconfig

ssh-keygen -o -a 100 -t rsa -b 4096 -C "scheel.ryan@gmail.com" -q -N "" -f ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub
echo "github ssh key copied to clipboard, add to github now."
read -p "Press enter to continue when done"

git remote set-url origin git@github.com:rascheel/dotfiles.git
echo "Changed git remote url to the ssh url, in case I probably used https."
