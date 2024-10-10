# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="geometry/geometry"

plugins=(git zsh-nvm)

# don't call nvm use default on start
export NVM_NO_USE=true
# load .nvmrc version on directory change
export NVM_AUTO_USE=true

# source omz
source $ZSH/oh-my-zsh.sh

# User configuration
# omz is now available

# Make brew work on an m1
eval "$(/opt/homebrew/bin/brew shellenv)"

# Frontify docker scripts
export PATH="$PATH:$HOME/frontify/docker/bin"

#GPG
export GPG_TTY=$(tty)

# Golang
export GOPATH="$HOME/go"
PATH="$GOPATH/bin:$PATH"

# Aliases
alias vi="nvim"
alias vim="nvim"


# roc
export PATH=$PATH:~/learning/roc/roc_nightly-macos_apple_silicon-2024-09-26-8c737868aa
