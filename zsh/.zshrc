# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=20
SAVEHIST=1000
setopt beep nomatch notify
unsetopt autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/rarcosmocha/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
PROMPT='%F{250}%n@%m%f:%F{242}%~%f%#'
