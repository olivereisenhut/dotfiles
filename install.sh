#!/bin/bash

SCRIPTPATH=$(pwd -P)

echo "Starting installation"

# go to downloads for further installations
cd ~/Downloads

#Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Install Cask
brew tap caskroom/cask

######################
# PACKAGES
######################

# Brew
brew install wget

# Brew Cask
brew cask install google-chrome firefox spotify iterm2 skype docker docker-tools docker-toolbox sourcetree


######################
# Zsh
######################

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# spaceship theme
curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.sh | zsh

######################
# Coding
######################

# NODE JS #

# nvm => https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-16-04
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh -o install_nvm.sh
sudo -u "$(whoami)" bash install_nvm.sh
source ~/.bashrc
source ~/.bash_profile
source ~/.zshrc

#install lts verison
nvm install stable
nvm use stable

source ~/.profile
source ~/.bashrc
source ~/.bash_profile

function copy_dotfiles() {
  cd "$SCRIPTPATH"
  rsync ./.* ~/ --exclude=.git 
}

#subscripts
copy_dotfiles