#!/bin/bash

SCRIPTPATH=$(pwd -P)

echo "Starting installation"

#keyserver #
# -> rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# -> spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
# -> google
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
# -> yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

# add repositories
# jdk
sudo add-apt-repository ppa:openjdk-r/ppa
# spotify
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
# chrome
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
# yarn
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list


# go to downloads for further installations
cd ~/Downloads

#update machine first

sudo apt-get update
sudo apt-get dist-upgarde -y
sudo apt-get upgrade -y


######################
# PACKAGES
######################

sudo apt install aptitude  vim zsh tmux htop openjdk-8-jdk imagemagick culr git google-chrome-stable firefox spotify-client yarn -y

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

# RUBY #

# rvm => https://rvm.io/rvm/install
curl -sSL https://get.rvm.io | bash -s stable --with-default-gems="rails bundler" --ruby
source ~/.bashrc


# Editors and Ides #

# Jetbrains Toolbox

curl https://download-cf.jetbrains.com/toolbox/jetbrains-toolbox-1.2.2314.tar.gz | tar xvz
cd "jetbrains-toolbox-1.2.2314"
./jetbrains-toolbox
cd "$SCRIPTPATH"

# Vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

source ~/.profile
source ~/.bashrc


function install_elementary_stuff() {
  #change terminal colors
  wget -O xt  http://git.io/v6JYg && chmod +x xt && ./xt && rm xt
}

function install_npm_packages() {
   npm install -g gulp grunt create-react-app diff-so-fancy
   git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
}

function copy_dotfiles() {
  cd "$SCRIPTPATH"
  rsync ./.* ~/ --exclude=.git 
}

#subscripts
install_elementary_stuff
copy_dotfiles
install_npm_packages
