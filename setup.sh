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
sudo apt-get install xclip  # needed to use pbcopy and pbpaste

# git pull and install dotfiles as well
cd $HOME
if [ -d ./edx-dotfiles/ ]; then
    mv edx-dotfiles edx-dotfiles.old
fi

git clone https://github.com/elimence/edx-dotfiles.git
ln -sb edx-dotfiles/.screenrc .
ln -sb edx-dotfiles/.bash_profile .
ln -sb edx-dotfiles/.bashrc .
ln -sb edx-dotfiles/.bashrc_custom .
ln -sb edx-dotfiles/.bash_aliases .
ln -sb edx-dotfiles/.bash_functions .

# setup terminal to be git-aware
cd $HOME
if [-d ./.bash/ ]; then
    mv .bash .bash.old
fi

mkdir .bash
cd .bash
git clone https://github.com/jimeh/git-aware-prompt.git

echo "Setup completed! Rebooting now ..."
sudo reboot
