xset r rate 214 33

#
# fasd
#
eval "$(fasd --init posix-alias zsh-hook)"
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
alias v='f -e vim' # quick opening files with vim
alias o='a -e xdg-open' # quick opening files with xdg-open


#
# misc
#
alias fn="find . -name"
alias fni="find . -iname"
alias g="grep -nIr"
function c() {
    cd $@ && ls
}
alias l="ls -la"

#
# Dolphin
#
export QT_QPA_PLATFORMTHEME=qt5ct
