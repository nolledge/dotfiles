#!/usr/bin/zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/christof/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

source "${HOME}/.zgen.zsh"
if ! zgen saved; then
	zgen load zsh-users/zsh-history-substring-search
	zgen load zsh-users/zsh-syntax-highlighting
	zgen load zsh-users/zsh-completions src
	zgen save
fi

export TERM=xterm

eval "$(starship init zsh)"
source ~/.aliases
source ~/.env

