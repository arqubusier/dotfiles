#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias audio='ponymix unmute && ponymix set-volume 100'
export PS1='\[\033[01;32m\]\u@\h \[\033[00;31m\]\W \$ \[\033[00m\]'

#Evironment variables
#export TIGCC=/usr/local/tigcc
#export PATH=$PATH:$TIGCC/bin
export EDITOR=vim
INTELLIJ_DIR=/home/herman/intellij/bin
if [ -d "$INTELLIJ_DIR" ]; then
    export PATH=${PATH}:$INTELLIJ_DIR
fi
