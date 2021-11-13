#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [[ "$(tty)" != "/dev/tty1" ]]; then
    neofetch
fi
alias config='/usr/bin/git --git-dir=/home/lgaboury/.cfg/ --work-tree=/home/lgaboury'
