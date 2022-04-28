sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt -y update
sudo apt -y upgrade
sudo apt -y install python3.9 python3.9-dev python3.9-venv

echo 'python 3.9 setup, can create a virtual env with "python3.9 -m venv venv" followed by "source venv/bin/activate"'
