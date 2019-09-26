export ZSH="/home/metyslav/.oh-my-zsh"

# Lines configured by zsh-newuser-install
setopt appendhistory autocd extendedglob nomatch notify
# End of generated lines

ZSH_THEME="agnoster"

export UPDATE_ZSH_DAYS=14

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd.mm.yyyy"

plugins=(git archlinux wd)

source $ZSH/oh-my-zsh.sh

# User configuration

# Import colorscheme from 'wal' asynchronously
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

# default apps
export TERMINAL=termite
export BROWSER=chromium
export EDITOR=nvim

# Aliases
alias reboot='sudo reboot'
alias wifi-menu='sudo wifi-menu'
alias _vim='/usr/bin/vim'
alias vim='$EDITOR -p'
alias v='$EDITOR -p'
alias sv='sudoedit'
alias i3conf='$EDITOR ~/.config/i3/config'
alias vconf='$EDITOR nvim ~/.vimrc'
alias vsource='source ~/.vimrc'
alias zconf='$EDITOR nvim ~/.zshrc'
alias zsource='source ~/.zshrc' 
alias md='mkdir'
alias shkey='xev | awk -F'\''[ )]+'\'' '\''/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'\'''
alias ls='ls -ahF'
alias rm=' timeout 3 rm -Iv --one-file-system'
alias hist='history | grep'
alias cp='cp -i'
alias mv='mv -i'
alias c='clear'
alias cls='echo -ne "\033c"' # clear screen for real
alias gdf='/usr/bin/git --git-dir=/home/metyslav/.dotfiles/ --work-tree=/home/metyslav'

