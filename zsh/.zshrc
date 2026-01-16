zstyle ':omz:update' frequency 7
zstyle ':omz:update' mode auto

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

#GPG
export GPG_TTY=$(tty)

# Golang
export GOPATH="$HOME/go"
PATH="$GOPATH/bin:$PATH"

# bun
export PATH="$HOME/.bun/bin:$PATH"


# Load local aliases
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

# Aliases
alias vi="nvim"
alias vim="nvim"

# docker once again
export DOCKER_HOST=unix://$HOME/.orbstack/run/docker.sock

eval "$(direnv hook zsh)"
