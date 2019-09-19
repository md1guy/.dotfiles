#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Set powerline-patched font for tty
setfont /usr/share/kbd/consolefonts/ter-powerline-v16b.psf.gz

