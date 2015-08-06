#!/bin/bash
# update dotfiles

# git pull and install dotfiles as well
cd $HOME
if [ ! -d ./edx-dotfiles/ ]; then
    git clone https://github.com/elimence/edx-dotfiles.git
    ln -sb edx-dotfiles/.screenrc .
    ln -sb edx-dotfiles/.bash_profile .
    ln -sb edx-dotfiles/.bashrc .
    ln -sb edx-dotfiles/.bashrc_custom .
    ln -sb edx-dotfiles/.bash_aliases .
    ln -sb edx-dotfiles/.bash_functions .
fi


# Check and update edx-dotfiles if need be
cd ~/edx-dotfiles
git fetch origin
reslog=$(git log HEAD..origin/master --oneline)
if [[ "${reslog}" != "" ]] ; then
  git merge origin/master # completing the pull
fi


# setup terminal to be git-aware
cd $HOME
if [ ! -d ./.bash/ ]; then
    mkdir .bash
	cd .bash
	git clone https://github.com/jimeh/git-aware-prompt.git
fi


# Check and update git-aware-prompt if need be
cd ~/.bash/git-aware-prompt;
git fetch origin
reslog=$(git log HEAD..origin/master --oneline)
if [[ "${reslog}" != "" ]] ; then
  git merge origin/master # completing the pull
fi

