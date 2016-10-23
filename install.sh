#!/bin/sh

SCRIPTPATH=`pwd -P`

echo "Starting installation"


# go to downloads for further installations
cd ~/Downloads


#Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Install Cask
brew tap caskroom/cask


######################
# Management Software
######################


#jkd
brew cask install java

#wget
brew install wget

#git
brew install git

#google chrome
brew cask install google-chrome

#firefox
brew cask install firefox

#spotify
brew cask install spotify

#iterm2
brew cask install iterm2


######################
# Coding
######################

# NODE JS #

#nvm => https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-16-04
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh -o install_nvm.sh
sudo -u "$(whoami)" bash install_nvm.sh
source ~/.bash_profile

#install lts verison
nvm install 4.4.7
nvm use 4.4.7

# RUBY #

#rvm => https://rvm.io/rvm/install
curl -L https://get.rvm.io | bash -s stable --ruby


# PHP #
brew install php70

brew cask install atom
brew cask install phpstorm
brew cask install intellij-idea

source ~/.profile
source ~/.bashrc
source ~/.bash_profile


#subscripts
installAtomPackages
installDotFiles


function installAtomPackages() {
  #beautify
  apm install atom-beautify
  apm install pigments



  #linters & co
  apm install linter
  apm install linter-eslint
  apm install linter-stylelint

}

function installDotFiles() {
  cd $SCRIPTPATH
  cp ./.* ~/.
}
