sudo -y yum update
sudo -y yum install vim-X11 vim-common vim-enhanced vim-minimal
sudo -y yum groupinstall 'Development Tools'
sudo cp google-chrome.repo /etc/yum.repos.d/
sudo -y yum install google-chrome-stable
