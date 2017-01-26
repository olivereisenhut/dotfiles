#!/bin/sh

SCRIPTPATH=`pwd -P`

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

#add repositories
#jdk
sudo add-apt-repository ppa:openjdk-r/ppa
#spotify
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
#chrome
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
#yarn
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list


# go to downloads for further installations
cd ~/Downloads

#update machine first

sudo apt-get update
sudo apt-get dist-upgarde -y
sudo apt-get upgrade -y


######################
# Management Software
######################

#aptitude
sudo apt-get install aptitude -y

#vim
sudo apt-get install vim -y

#zsh
sudo apt-get install zsh -y

#tmux
sudo apt-get install tmux -y

#openjdk 8
sudo apt-get install openjdk-8-jdk -y

#imagemagick
sudo apt-get install imagemagick -y

#curl
sudo apt-get intall curl -y

#git
sudo apt-get install git -y

#google chrome
sudo apt-get install google-chrome-stable -y

#firefox
sudo apt-get install firefox -y

#spotify
sudo apt-get install spotify-client -y

#yarn
sudo apt-get install yarn -y

######################
# Zsh
######################

#oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# spaceship theme
curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.sh | zsh

######################
# Coding
######################

# NODE JS #

#nvm => https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-16-04
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh -o install_nvm.sh
sudo -u "$(whoami)" bash install_nvm.sh
source ~/.bashrc

#install lts verison
nvm install 4.4.7
nvm use 4.4.7

# RUBY #

#rvm => https://rvm.io/rvm/install
curl -sSL https://get.rvm.io | bash -s stable --ruby
source ~/.bashrc
rvm install ruby-2.4.0

# Editors and Ides #

#Atom
curl -s -L https://atom.io/download/deb -o atom_installer.deb
sudo dpkg -i atom_installer.deb
sudo rm -f atom_installer


#Phpstorm
curl -L https://download-cf.jetbrains.com/webide/PhpStorm-2016.3.2.tar.gz -o phpstorm_installer.tar.gz
sudo mv phpstorm_installer.tar.gz /opt
cd /opt
sudo tar xfz phpstorm_installer.tar.gz
sudo rm -f phpstorm_installer.tar.gz
cd ~/Downloads

#IntelliJ community
curl -L https://download-cf.jetbrains.com/idea/ideaIU-2016.3.1-no-jdk.tar.gz -o intelliJ.tar.gz
sudo mv intelliJ.tar.gz /opt
cd /opt
sudo tar xfz intelliJ.tar.gz
sudo rm -f intelliJ.tar.gz
cd ~/Downloads

#Vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

source ~/.profile
source ~/.bashrc


function install_elementary_stuff() {
  #change terminal colors
  wget -O xt  http://git.io/v6JYg && chmod +x xt && ./xt && rm xt
}

function install_atom_packages() {
  #beautify
  apm install atom-beautify
  apm install pigments
  apm install react

  #themes
  apm install gruvbox-plus-syntax
  apm install octocat-syntax

  #linters & co
  apm install linter
  apm install linter-eslint
  apm install linter-stylelint

}

function install_npm_packages() {
   yarn global add gulp grunt gatsby create-react-app 
}

function copy_dotfiles() {
  cd $SCRIPTPATH
  rsync ./.* ~/ --exclude=.git 
}

#subscripts
install_atom_packages
install_elementary_stuff
copy_dotfiles
install_npm_packages
