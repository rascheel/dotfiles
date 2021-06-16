# Install Mutt
sudo apt-get -y install mutt

## Create directories for mutt
mkdir -p ~/.mutt/cache/headers
mkdir ~/.mutt/cache/bodies
touch ~/.mutt/certificates

## Copy config file for mutt
cp ~/git/dotfiles/muttrc ~/.mutt/

# Things that would be dumb to put in a repo
echo "--------Go set your password-------"
sleep 2
nvim ~/.mutt/muttrc

