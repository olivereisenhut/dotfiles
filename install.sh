#!/bin/bash

SCRIPTPATH=$(pwd -P)

echo "Starting installation"

echo "Installing Brew"

{
  # go to downloads for further installations
  cd ~/Downloads

  #Install Brew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  #Install Cask
  brew tap caskroom/cask

} > /dev/null

######################
# PACKAGES
######################

echo "Install Brew packages"

{
  # Brew
  brew install wget \
               neovim \
               httpstat

  # Brew Cask
  brew cask install google-chrome \
                    firefox \
                    spotify \
                    iterm2 \
                    skype \
                    docker \
                    docker-toolbox \
                    sourcetree \
                    alfred \
                    java \
                    spectacle

}

######################
# Zsh
######################

# oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# geometry theme
git clone https://github.com/geometry-zsh/geometry.git $HOME/.oh-my-zsh/custom/themes/geometry

######################
# Coding
######################

# NODE JS #

echo "Install NodeJs"

{
  # nvm => https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-16-04
  curl -fsSL https://raw.githubusercontent.com/creationix/nvm/master/install.sh -o install_nvm.sh
  sudo -u "$(whoami)" bash install_nvm.sh

} > /dev/null

source ~/.zshrc

function copy_dotfiles() {
  cd "$SCRIPTPATH"
  rsync ./.* ~/ --exclude=.git 
}

#subscripts
copy_dotfiles
