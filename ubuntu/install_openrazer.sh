#!/bin/bash
set -e

sudo apt -y install software-properties-gtk
sudo add-apt-repository ppa:openrazer/stable
sudo apt update
sudo apt -y install openrazer-meta
sudo gpasswd -a $USER plugdev
