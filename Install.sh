#!/bin/bash

# make sure we're root
if [ "$HOME" != "/root" ]
then
    echo -e "${GREEN}[*] Please run as root.${NC}"
    exit 1
fi

#Colors
GREEN='\033[0;32m'
NC='\033[0m'

#Apt update Kali box
echo -e "${GREEN}[*] Apt Update${NC}"
apt -y update

#Install dos2unix
echo -e "${GREEN}[*] Install dos2unix${NC}"
apt-get install -y dos2unix

#Install dot files
echo -e "${GREEN}[*] Install dot files${NC}"
dos2unix dotfilesetup.sh
bash dotfilesetup.sh

#Install Zsh and Configurations
echo -e "${GREEN}[*] Install Zsh and Configurations${NC}"
dos2unix zshinstall.sh
bash zshinstall.sh

#Install Tools
echo -e "${GREEN}[*] Install Tools${NC}"
dos2unix toolinstall.sh
bash toolinstall.sh

#Install Custom Pimpmykali
echo -e "${GREEN}[*] Install Pimpmykali${NC}"
echo -e "${GREEN}[*] Press Option 0!!!!!!!!!!!!!!!${NC}"
dos2unix pimpmykali.sh
bash pimpmykali.sh