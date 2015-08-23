#!/bin/bash

# Listing, directories, and motion
alias ll="ls -alrtF --color"
alias la="ls -A"
alias l="ls -CF"
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias m='less'
alias ..='cd ..'
alias ...='cd ..;cd ..'
alias md='mkdir'
alias cl='clear'
alias du='du -ch --max-depth=1'
alias treeacl='tree -A -C -L 2'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

### *************** ALIASES FOR WORKING WITH EDX ***************

# Getting around
alias edx-goto_conf='cd /var/tmp/configuration'
alias edx-goto_pbks='cd /var/tmp/configuration/playbooks'
alias edx-goto_platform='cd /edx/app/edxapp/edx-platform'
alias edx-goto_lms='cd /edx/app/edxapp/edx-platform/lms'
alias edx-goto_cms='cd /edx/app/edxapp/edx-platform/cms'
alias edx-edit_server-vars="sudo vim /edx/app/edx_ansible/server-vars.yml"



### *************** HELP ALIASES ***************

alias edx-update_script="sh ~/edx-dotfiles/update.sh"