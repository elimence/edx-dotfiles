#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm

# update system
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

# install various programs
sudo apt-get install -y git
sudo apt-get install screen

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi

git clone https://github.com/elimence/edx-dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sb dotfiles/.bash_aliases .
ln -sb dotfiles/.bash_functions .

# setup terminal to be git-aware
cd $HOME
if [-d ./.bash/ ]; then
    mv .bash .bash.old
fi

mkdir .bash
cd .bash
git clone https://github.com/jimeh/git-aware-prompt.git
