export ZSH="/home/metyslav/.oh-my-zsh"

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
setopt appendhistory autocd extendedglob nomatch notify

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
# (cat ~/.cache/wal/sequences &)

# default apps
export TERMINAL=termite
export BROWSER=firefox-developer-edition
export EDITOR=nvim

# Aliases
alias reboot='sudo reboot'
alias wifi-menu='sudo wifi-menu'
alias _vim='/usr/bin/vim'
alias vim='$EDITOR -p'
alias v='$EDITOR -p'
alias vs='vim -S .config/nvim/sessions/default.vim'
alias sv='sudoedit'
alias i3conf='$EDITOR ~/.config/i3/config'
alias vconf='$EDITOR nvim ~/.vimrc'
alias vsource='source ~/.vimrc'
alias zconf='$EDITOR nvim ~/.zshrc'
alias zsource='source ~/.zshrc' 
alias md='mkdir'
alias shkey='xev | awk -F'\''[ )]+'\'' '\''/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'\'''
alias ls='ls -ahF'
alias hist='history | grep'
alias cp='cp -i'
alias mv='mv -i'
alias c='clear'
alias cls='echo -ne "\033c"' # clear screen for real
alias gdf='/usr/bin/git --git-dir=/home/metyslav/.dotfiles/ --work-tree=/home/metyslav'
alias lf='~/go/bin/lf'
