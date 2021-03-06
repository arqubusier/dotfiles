#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#
# Aliases
#
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias ls='ls --color=auto'
alias audio='ponymix unmute && ponymix set-volume 100'
alias cmakeu='cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug'
alias mwin='sudo mount /dev/sda4 ~/windows'
alias ghcp='/usr/share/ghc-pristine/bin/ghc'
alias ghcip='/usr/share/ghc-pristine/bin/ghci'
alias multiscreen='xrandr   --output   LVDS1 --auto --output DP1 --auto --above LVDS1'
alias layout='setxkbmap -model pc104 -layout us,se -variant dvorak, -option grp:alt_shift_toggle'
alias wine32='WINEPREFIX="$HOME/.wine32" wine'
alias setlayout='setxkbmap -model pc104 -layout us,se -variant dvorak, -option grp:alt_caps_toggle'

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
export PATH="~/.cabal/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/bin:$PATH"

# Fix for java swing applications for tiling window managers.
# Lies to java about "LG3D" being the current wm.
wmname LG3D

#
# nnn
#
[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"

n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
