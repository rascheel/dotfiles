git config --global user.name "Ryan Scheel"
git config --global user.email "scheel.ryan@gmail.com"
ssh-keygen -t rsa -C "scheel.ryan@gmail.com" -q -N "" -f ~/.ssh/id_rsa
sudo apt-get -y install xclip
xclip -sel clip < ~/.ssh/id_rsa.pub
echo "github ssh key copied to clipboard, add to github now."
git remote set-url origin git@github.com:rascheel/dotfiles.git
echo "Changed git remote url to the ssh url, in case I probably used https."
