# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

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
	zgen oh-my-zsh
	zgen load zsh-users/zsh-history-substring-search
	zgen load zsh-users/zsh-syntax-highlighting
	zgen load zsh-users/zsh-completions src
	zgen save
fi

export TERM=xterm

source ~/.aliases
source ~/.env
 source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
 [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
bindkey -v
