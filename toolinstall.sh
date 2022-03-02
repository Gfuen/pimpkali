#!/bin/bash

#Colors
GREEN='\033[0;32m'
NC='\033[0m'

#Install venv for pipx virtual environments
echo -e "${GREEN}[*] Installing Python3-venv${NC}"
apt-get install -y python3-venv

#Install pipx 
echo -e "${GREEN}[*] Installing Pipx${NC}"
qterminal -e python3 -m pip install pipx; python3 -m pipx ensurepath

#Make Zsh default shell
echo -e "${GREEN}[*] Change default shell to Zsh${NC}"
chsh -s /bin/zsh

# Make sure pipx is installed
echo -e "${GREEN}[*] Checking if PIPX is installed${NC}"
if pip list | grep -F pipx &> /dev/null; then
    echo -e "${GREEN}[*] Pipx installed${NC}"
else
    echo 'uh oh. Pipx is not installed.'
    exit 1
fi

#Install other dependencies
echo -e "${GREEN}[*] Installing Dependencies that arent bug bounty tools${NC}"
apt-get install -y rlwrap
apt-get install -y powershell
apt-get install -y xclip
apt-get install -y cmake
apt-get install -y grc
apt-get install -y awscli
apt-get install -y gcc 
apt-get install -y inetutils-ping 
apt-get install -y make  
apt-get install -y python3-pip 
apt-get install -y python-pip 
apt-get install -y dnsutils 

#Install gnumeric for converting excel files
echo -e "${GREEN}[*] Installing Gnumeric${NC}"
apt-get -y install gnumeric

#Install pure-ftpd
echo -e "${GREEN}[*] Installing pure-ftpd${NC}"
apt install -y pure-ftpd

#Install fcrackzip for cracking zip files with passwords
echo -e "${GREEN}[*] Installing fcrackzip${NC}"
apt-get install fcrackzip

#Install seclists for passwords
echo -e "${GREEN}[*] Installing Seclists${NC}"
apt-get install seclists

#Install exa
echo -e "${GREEN}[*] Installing EXA${NC}"
apt install exa

#Make folders
echo -e "${GREEN}[*] Creating Home Folders${NC}"
cd /home/kali/Desktop/
mkdir -p HTB

#Create Tools Dir
echo -e "${GREEN}[*] Creating Config Folder${NC}"
cd ~/
mkdir -p Config

#Install python2to3
echo -e "${GREEN}[*] Installing 2to3${NC}"
python3 -m pipx install 2to3

#Install tldr 
echo -e "${GREEN}[*] Installing tldr${NC}"
python3 -m pipx install tldr.py

#Install bloodhound
echo -e "${GREEN}[*] Installing Bloodhound${NC}"
python3 -m pipx install bloodhound
python3 -m pipx ensurepath

#Install Hash-Buster
echo -e "${GREEN}[*] Installing Hash-Buster${NC}"
cd /opt
git clone https://github.com/s0md3v/Hash-Buster.git
cd ./Hash-Buster
make install
cd /opt

#Install Autorecon
echo -e "${GREEN}[*] Installing Autorecon${NC}"
python3 -m pipx install git+https://github.com/Tib3rius/AutoRecon.git
python3 -m pipx ensurepath

#Install Updog
echo -e "${GREEN}[*] Installing Updog${NC}"
python3 -m pipx install updog
python3 -m pipx ensurepath

#Install Nishang
echo -e "${GREEN}[*] Installing Nishang${NC}"
cd /opt
git clone https://github.com/samratashok/nishang.git

#Add Scripts to Directory for PrivEsc 
echo -e "${GREEN}[*] Installing Privesc Scripts${NC}"
cd /opt
git clone https://github.com/Gfuen/Priv.git

# massdns
echo -e "${GREEN}[*] Installing massdns${NC}"
apt-get install -y libldns-dev
cd /opt
git clone https://github.com/blechschmidt/massdns.git
cd massdns/
make
ln -sf ~/Tools/massdns/bin/massdns /usr/local/bin/massdns

# Sublist3r
echo -e "${GREEN}[*] Installing Sublist3r${NC}"
cd /opt
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r/
pip3 install -r requirements.txt
ln -s ~/Tools/Sublist3r/sublist3r.py /usr/local/bin/sublist3r

# wafw00f
echo -e "${GREEN}[*] Installing wafw00f${NC}"
cd /opt
git clone https://github.com/enablesecurity/wafw00f.git 
cd wafw00f 
chmod +x setup.py 
python3 setup.py install

# joomscan
echo -e "${GREEN}[*] Installing joomscan${NC}"
cd /opt
git clone https://github.com/rezasp/joomscan.git 
cd joomscan/ 
chmod +x joomscan.pl
ln -sf ~/toolkit/joomscan/joomscan.pl /usr/local/bin/joomscan

# s3recon
echo -e "${GREEN}[*] Installing s3recon${NC}"
python3 -m pipx install 2to3

#Install Configs
cd ~/Config
wget -q https://raw.githubusercontent.com/Gfuen/pimpkali/master/Gfuen640.ovpn --show-progress -N  -P ~/Config

