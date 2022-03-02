#!/bin/bash

#Colors
GREEN='\033[0;32m'
NC='\033[0m'

if [ "$HOME" != "/root" ]
then
    echo -e "${GREEN}[*] Please run as root.${NC}"
    exit 1
fi

#Install git if not installed
apt-get install -y git
apt-get install -y tmux
apt-get install -y vim
apt-get install -y dos2unix

#Back up vim and bash config files
echo -e "${GREEN}[*] Backup VIM and Bashrc${NC}"
if [ -e .vimrc ]; then mv .vimrc .vimrc_bak; fi
if [ -e .vim ]; then mv .vim .vim_bak; fi

if [ -e /root/.vimrc ]; then mv /root/.vimrc /root/.vimrc_bak; fi
if [ -e /root/.vim ]; then mv /root/.vim /root/.vim_bak; fi
if [ -e /root/.tmux.conf ]; then mv /root/.tmux.conf /root/.tmux.conf_bak; fi

#Install Vundle
mkdir -p ~/.vim/bundle/Vundle.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#Make setup folder
echo -e "${GREEN}[*] Installing BugBounty Github Dotfiles to Home Directory${NC}"
wget https://raw.githubusercontent.com/Gfuen/HackTheBoxSetup/main/.tmux.conf 
wget https://raw.githubusercontent.com/Gfuen/HackTheBoxSetup/main/.vimrc 
dos2unix .tmux.conf
dos2unix .vimrc

#Create dotfiles Directory
dotfilesDir=$(pwd)

function linkDotfile {
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/${1} ]; then
    # Existing symlink 
    echo "Removing existing symlink: ${dest}"
    rm ${dest} 

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

#Install Tmux plugin manager
echo -e "${GREEN}[*] Installing Dotfiles${NC}"
linkDotfile .vimrc
linkDotfile .tmux.conf

#Install Tmux plugin manager
echo -e "${GREEN}[*] Installing Tmux plugin manager${NC}"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#Install VIM plugins
vim +PluginInstall +qall
