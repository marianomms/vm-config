#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# ZSH is the default shell in macOS
# echo "*** Installing zsh: set zsh as default shell ***"
# chsh -s $(which zsh)
# echo

# echo "*** INSTALLING BREW ***"
# sudo apt-get install build-essential procps curl file git
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# echo

# echo "*** Customising zsh ***"
# brew install wget
# wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh


#########
## STEP 2
## NOTE: Once Oh my zsh is installed:
## Edit the file to enable/disable plugins .zshrc file the plugin
## plugins=(
##     # other plugins...
## )
## Check the: ZSH_THEME="agnoster"
## 1. Close the tab and reopen a new one
## 2. Comment the code above this
## 3. Uncomment code below this
## 4. Run againt this file
#########
# echo
# brew install zsh-syntax-highlighting zsh-autosuggestions powerlevel10k
echo
./custom_zsh.sh
rm ~/.zshrc_mms_vm
# echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.zshrc
# echo 'source ~/.zshrc_mms_common' >> ~/.zshrc
# echo

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
# brew install rbenv bat awscli ack docker-credential-helper-ecr

# echo "*** Configuring vim ***"
# brew install vim
# ./install_vim_ubuntu.sh
# echo
