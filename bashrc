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
alias multiscreen='xrandr   --output   LVDS1 --auto --output DP1 --auto --above LVDS1'
alias layout='setxkbmap -model pc104 -layout us,se -variant dvorak, -option grp:alt_shift_toggle'
alias wine32='WINEPREFIX="$HOME/.wine32" wine'
export PS1='\[\033[01;32m\]\u@\h \[\033[00;31m\]\W \$ \[\033[00m\]'

#
# Python
#
#doeson't work pip completion --bash

#
# Evironment variables
#

export EDITOR=vim

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
alias ranger='ranger --choosedir=$HOME/rangerdir;cd $(cat $HOME/rangerdir)'

#arch
alias x230_display="xrandr --output LVDS1 --auto --output DP1 --auto --above LVDS1"
alias ida_display="xrandr --output DP1 --auto --output HDMI1 --auto --right-of DP1"

alias dim="sudo tee /sys/class/backlight/intel_< 2000"

export PATH="~/scripts:$PATH"
export PATH="~/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/bin:$PATH"

# Fix for java swing applications for tiling window managers.
# Lies to java about "LG3D" being the current wm.
wmname LG3D
