#!/bin/sh

echo "Starting installation"

#add repositories
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
#spotify
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
#chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'


#keyserver #
# -> rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# -> spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886




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

#openjdk 8
sudo apt-get install openjdk-8-jdk -y

#imagemagick
sudo apt-get install imagemagick -y

#curl
sudo apt-get intall curl -y

#git
sudo apt-get install git -y

#google chrome
sudo apt-get install 	google-chrome-stable -y

#firefox
sudo apt-get install firefox -y

#spotify
sudo apt-get install spotify-client -y



######################
# Coding
######################

# NODE JS #

#nvm => https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-16-04
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh -o install_nvm.sh
bash install_nvm.sh
source ~/.profile

#install lts verison
nvm install 4.4.7
nvm use 4.4.7

# RUBY #

#rvm => https://rvm.io/rvm/install
curl -sSL https://get.rvm.io | bash -s stable --ruby

# PHP #
sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql -y


# Servers #

#apache
sudo apt-get install apache2 -y
#mysql
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password '
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again '
sudo apt-get install mysql-server -y

# Editors and Ides #

#Atom
curl -s -L https://atom.io/download/deb -o atom_installer.deb
sudo dpkg -i atom_installer.deb

#Phpstorm
curl -s -L https://data.services.jetbrains.com/products/download?code=PS&platform=linux -o phpstorm_installer.tar.gz
sudo mv phpstorm_installer.tar.gz /opt
sudo tar -xfz phpstorm_installer.tar.gz
sudo rm -f phpstorm_installer.tar.gz

source ~/.profile
source ~/.bashrc
