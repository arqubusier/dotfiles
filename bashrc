#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#
# Aliases
#
alias ls='ls --color=auto'
alias audio='ponymix unmute && ponymix set-volume 100'
alias cmakeu='cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug'
alias mwin='sudo mount /dev/sda4 ~/windows'
export PS1='\[\033[01;32m\]\u@\h \[\033[00;31m\]\W \$ \[\033[00m\]'

#
# Python
#
#doeson't work pip completion --bash

#
# Evironment variables
#

#export TIGCC=/usr/local/tigcc
#export PATH=$PATH:$TIGCC/bin
export EDITOR=vim
INTELLIJ_DIR=/home/herman/intellij/bin
if [ -d "$INTELLIJ_DIR" ]; then
    export PATH=${PATH}:$INTELLIJ_DIR
fi
export PATH=${PATH}:/home/herman/.gem/ruby/2.2.0/bin
