dotfiles
========

Repo to hold all my linux settings.

Download this repo and setup git
```bash
sudo apt install git
mkdir -p ~/git/personal
git clone https://github.com/rascheel/dotfiles.git ~/git/personal/dotfiles
cd ~/git/personal/dotfiles
./scripts/gitSetup.sh
```

Install all my packages and setup vimrc after a fresh install
```bash
./ubuntu/freshInstall.sh
./scripts/configure.sh
```

Set the GDM login wallpaper so it's not so awful
```bash
sudo scripts/borrowed/ubuntu-gdm-set-background --image ~/Pictures/Wallpapers/WALLPAPER_NAME.jpg
```
