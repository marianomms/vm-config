#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "*** Installing zsh: Installing zsh package ***"
sudo apt install zsh
touch ~/.zshrc
echo

echo "*** Installing zsh: set zsh as default shell ***"
chsh -s $(which zsh)
echo

echo "*** Customising zsh ***"
sudo apt install wget
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

#########
## STEP 2
## NOTE: Once Oh my zsh is installed:
## 1. Close the tab and reopen a new one
## 2. Comment the code above this
## 3. Uncomment code below this
## 4. Run againt this file
#########
# echo
# ./custom_zsh.sh
# rm ~/.zshrc_mms_vm
# echo

# read -p "user.email for git? " email
# read -p "$email, correct? (y/n)" answer
# if [ "$answer" != "${answer#[Yy]}" ] ;then
#   git config --global user.email "$email"
# fi

# read -p "name for git? " name
# read -p "$name, correct? (y/n)" answer
# if [ "$answer" != "${answer#[Yy]}" ] ;then
#   git config --global user.name "$name"
# fi

# echo "*** INSTALLING BREW ***"
# sudo apt-get install build-essential procps curl file git
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# echo

# echo "*** Configuring brew ***"
# test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
# test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.zshrc
# echo 'source ~/.zshrc_mms_common' >> ~/.zshrc

#########
## STEP 3
## NOTE: Once brew is configured and .zshrc updated
## 1. Close the tab and reopen a new one
## 2. Comment the code above this
## 3. Uncomment code below this
## 4. Run againt this file
#########

# echo "*** Install brew formulas ***"
# brew install rust
# brew install ruby
# brew install rbenv bat

# echo "*** Configuring vim ***"
# brew install vim
# ./install_vim_ubuntu.sh
# echo
