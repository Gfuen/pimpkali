#!/bin/bash

#Colors
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}[*] Install Basic Tools${NC}"
if command -v zsh &> /dev/null && command -v git &> /dev/null && command -v wget &> /dev/null; then
    echo -e "${GREEN}[*] ZSH and Git are already installed${NC}"
else
    if sudo apt install -y zsh git wget || sudo pacman -S zsh git wget || sudo dnf install -y zsh git wget || sudo yum install -y zsh git wget || sudo brew install git zsh wget || pkg install git zsh wget ; then
        echo -e "zsh wget and git Installed\n"
        echo -e "${GREEN}[*] ZSH WGET and GIT installed${NC}"
    else
        echo -e "${GREEN}[*] Please install the following packages first, then try again: zsh git wget${NC}"
    fi
fi

echo -e "${GREEN}[*] Install Fonts${NC}"
#Install font tools
#sudo add-apt-repository universe
#sudo apt install -y gnome-tweak-tool
sudo apt install fonts-powerline

echo -e "${GREEN}[*] Set Timezone${NC}"
#Set Timezone
sudo timedatectl set-timezone America/Mexico_City

echo -e "${GREEN}[*] Backup Timezone${NC}"
if mv -n ~/.zshrc ~/.zshrc-backup-$(date +"%Y-%m-%d"); then # backup .zshrc
    echo -e "Backed up the current .zshrc to .zshrc-backup-date\n"
fi

echo -e "${GREEN}[*] Install Custom ZSHRC file${NC}"
wget https://raw.githubusercontent.com/Gfuen/pimpkali/master/.zshrc

echo -e "${GREEN}[*] Install OH-MY-ZSH${NC}"
if [ -d ~/.oh-my-zsh ]; then
    echo -e "${GREEN}[*] OH-MY-ZSH already installed${NC}"
else
    git clone --depth=1 git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

echo -e "${GREEN}[*] Copy ZSHRC to Root folder${NC}"
cp -f .zshrc ~/
mkdir -p ~/.quickzsh       # external plugins, things, will be instlled in here

echo -e "${GREEN}[*] Install ZSH-AUTOCOMPLETE and Update${NC}"
if [ -d ~/.oh-my-zsh/plugins/zsh-autocomplete ]; then
    cd ~/.oh-my-zsh/plugins/zsh-autocomplete && git pull
else
    git clone --depth=1 https://github.com/marlonrichert/zsh-autocomplete ~/.oh-my-zsh/plugins/zsh-autocomplete
fi

echo -e "${GREEN}[*] Install ZSH-SYNTAX-HIGHLIGHTING and Update${NC}"
if [ -d ~/.oh-my-zsh/plugins/zsh-syntax-highlighting ]; then
    cd ~/.oh-my-zsh/plugins/zsh-syntax-highlighting && git pull
else
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
fi

# INSTALL FONTS
echo -e "${GREEN}[*] Installing Nerd Fonts version of Hack, Roboto Mono, DejaVu Sans Mono${NC}"
mkdir -p ~/.local/share/fonts
wget -q --show-progress -N https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraMono/Regular/complete/Fira%20Mono%20Regular%20Nerd%20Font%20Complete.otf?raw=true -P ~/.local/share/fonts/

fc-cache -fv ~/.local/share/fonts/

echo -e "${GREEN}[*] Install Powerlevel10k${NC}"
if [ -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]; then
    cd ~/.oh-my-zsh/custom/themes/powerlevel10k && git pull
else
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
fi

echo -e "${GREEN}[*] Install Other plugins and stuff${NC}"
if [ -d ~/.oh-my-zsh/custom/plugins/k ]; then
    cd ~/.oh-my-zsh/custom/plugins/k && git pull
else
    git clone --depth 1 https://github.com/supercrabtree/k ~/.oh-my-zsh/custom/plugins/k
fi

if [ -d ~/.quickzsh/marker ]; then
    cd ~/.quickzsh/marker && git pull
else
    git clone --depth 1 https://github.com/pindexis/marker ~/.quickzsh/marker
fi

if ~/.quickzsh/marker/install.py; then
    echo -e "Installed Marker\n"
else
    echo -e "Marker Installation Had Issues\n"
fi

# source ~/.zshrc
echo -e "\nSudo access is needed to change default shell\n"

if chsh -s $(which zsh) && zsh -i -c upgrade_oh_my_zsh; then
    echo -e "Installation Successful, exit terminal and enter a new session"
else
    echo -e "Something is wrong"
fi
exit
