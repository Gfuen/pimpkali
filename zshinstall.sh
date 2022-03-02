#!/bin/bash

if command -v zsh &> /dev/null && command -v git &> /dev/null && command -v wget &> /dev/null; then
    echo -e "ZSH and Git are already installed\n"
else
    if sudo apt install -y zsh git wget || sudo pacman -S zsh git wget || sudo dnf install -y zsh git wget || sudo yum install -y zsh git wget || sudo brew install git zsh wget || pkg install git zsh wget ; then
        echo -e "zsh wget and git Installed\n"
    else
        echo -e "Please install the following packages first, then try again: zsh git wget \n" && exit
    fi
fi

#Install font tools
sudo add-apt-repository universe
sudo apt install -y gnome-tweak-tool
sudo apt install fonts-powerline
#Set Timezone
sudo timedatectl set-timezone America/Mexico_City


if mv -n ~/.zshrc ~/.zshrc-backup-$(date +"%Y-%m-%d"); then # backup .zshrc
    echo -e "Backed up the current .zshrc to .zshrc-backup-date\n"
fi

wget https://raw.githubusercontent.com/Gfuen/HackTheBoxSetup/main/.zshrc

echo -e "Installing oh-my-zsh\n"
if [ -d ~/.oh-my-zsh ]; then
    echo -e "oh-my-zsh is already installed\n"
else
    git clone --depth=1 git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

cp -f .zshrc ~/


mkdir -p ~/.quickzsh       # external plugins, things, will be instlled in here

if [ -d ~/.oh-my-zsh/plugins/zsh-autocomplete ]; then
    cd ~/.oh-my-zsh/plugins/zsh-autocomplete && git pull
else
    git clone --depth=1 https://github.com/marlonrichert/zsh-autocomplete ~/.oh-my-zsh/plugins/zsh-autocomplete
fi


# INSTALL FONTS

echo -e "Installing Nerd Fonts version of Hack, Roboto Mono, DejaVu Sans Mono\n"
mkdir -p ~/.local/share/fonts
wget -q --show-progress -N https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraMono/Regular/complete/Fira%20Mono%20Regular%20Nerd%20Font%20Complete.otf?raw=true -P ~/.local/share/fonts/

fc-cache -fv ~/.local/share/fonts/

if [ -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]; then
    cd ~/.oh-my-zsh/custom/themes/powerlevel10k && git pull
else
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
fi


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
