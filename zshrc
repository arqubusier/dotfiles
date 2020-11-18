# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/vsarchelu/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
xset r rate 214 33
alias setlayout='setxkbmap -model pc104 -layout us,se -variant dvorak, -option grp:alt_caps_toggle'

export AMSR_SIP_DIR=/home/vsarchelu/amsr-mono/adaptive-microsar
export ARTIFACTS_DIR="$AMSR_SIP_DIR/builds/native" 

#
# Bullseye
#
export PATH=/opt/bullseye/v8.15.22a/bin:$PATH
export COVFILE=~/Coverage/amsr-vector-fs-libvac.cov
alias covshow='covhtml -f$COVFILE ~/Coveragehmtl && xdg-open ~/Coveragehmtl/index.html&'

#
# QNX
#
export QNX_HOST=/home/vsarchelu/qnx/toolchain/qnx700/host/linux/x86_64/
export QNX_TARGET=/home/vsarchelu/qnx/toolchain/qnx700/target/qnx7/

#
# Tata
#
export GITHUB_V2_WORKINGCOPY=/home/vsarchelu/tata/amsr-tata-exchange-v2
export GITLAB_WORKINGCOPY=/home/vsarchelu/amsr-mono/adaptive-microsar
#
# Bauhaus
#
bauhaus_single_file_run () {
    python3 ${AMSR_SIP_DIR}/Infrastructure/bauhaus/utils/single_file_analysis/single_file_analysis.py -b "${AMSR_SIP_DIR}"/builds/single_file/amsr-vector-fs-libvac $*
}

bauhaus_single_file_setup() {
    cd $AMSR_SIP_DIR/Infrastructure/bauhaus/test
    source perform_test_env.sh
    cd $AMSR_SIP_DIR
    ./BuildHelper/BuildHelper -b builds/single_file -s . -t amsr-vector-fs-sec-libseccom --cmake-options-file BuildHelper/config/development.json --cmake-toolchain-file CMakeSupport/toolchain/cafeCC/cafeCC-6/x86_64/linux_debug.toolchain --skip-build -o MODULE:amsr-vector-fs-libvac:BUILD_TESTS=ON
}
source $AXIVION_BAUHAUS_HOME/bauhaus-kshrc
export AXIVION_BAUHAUS_DASHBOARD_HOME=/home/vsarchelu/amsr-mono/adaptive-microsar/Infrastructure/bauhaus/dashboard
#alias bauhaus_single_file_setup="$AMSR_SIP_DIR/BuildHelper/BuildHelper -b $AMSR_SIP_DIR/builds/single_file -s . -t amsr-vector-fs-libvac --cmake-options-file $AMSR_SIP_DIR/BuildHelper/config/development.json --cmake-toolchain-file $AMSR_SIP_DIR/CMakeSupport/toolchain/cafeCC/cafeCC-6/x86_64/linux_debug.toolchain --skip-build -o MODULE:amsr-vector-fs-libvac:BUILD_TESTS=ON"

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
alias g="grep -nIr"

#
# Dolphin
#
export QT_QPA_PLATFORMTHEME=qt5ct
