mkdir -p ~/git/personal
mkdir -p ~/git/work
ln -s ~/git/personal/dotfiles/gitconfig ~/.gitconfig
ln -s ~/git/personal/dotfiles/gitconfig-personal ~/git/personal/.gitconfig
ln -s ~/git/personal/dotfiles/gitconfig-work ~/git/work/.gitconfig

ssh-keygen -t rsa -C "scheel.ryan@gmail.com" -q -N "" -f ~/.ssh/id_rsa_personal
xclip -sel clip < ~/.ssh/id_rsa_personal.pub
echo "github ssh key copied to clipboard, add to github now."
read -p "Press enter to continue when done"

ssh-keygen -t rsa -C "ryan.scheel@timesys.com" -q -N "" -f ~/.ssh/id_rsa_work
xclip -sel clip < ~/.ssh/id_rsa_work.pub
echo "work ssh key copied to clipboard, add to gitlab now."
read -p "Press enter to continue when done"

git remote set-url origin git@github.com:rascheel/dotfiles.git
echo "Changed git remote url to the ssh url, in case I probably used https."
