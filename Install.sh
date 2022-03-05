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
apt-get -y update

#Install dos2unix
echo -e "${GREEN}[*] Install dos2unix and change files to correect format${NC}"
apt-get install -y dos2unix
dos2unix *.sh

#Install dot files
echo -e "${GREEN}[*] Install dot files${NC}"
bash dotfilesetup.sh

#Install Zsh and Configurations
echo -e "${GREEN}[*] Install Zsh and Configurations${NC}"
bash zshinstall.sh

#Install Custom Pimpmykali
echo -e "${GREEN}[*] Install Pimpmykali${NC}"
echo -e "${GREEN}[*] Press Option 0 and N to default Root login!!!!!!!!!!!!!!!${NC}"
bash pimpmykali.sh

#Install Tools
echo -e "${GREEN}[*] Install Tools${NC}"
bash toolinstall.sh