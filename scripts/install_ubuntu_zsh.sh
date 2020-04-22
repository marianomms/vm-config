#!/bin/bash

echo "*** INSTALLING ZSH: INSTALLING NEEDED PACKAGES ***"
sudo apt install openssh-server tmux ifupdown ack tilix git-cola zsh
echo

echo "*** INSTALLING ZSH: CONFIGURING VIM ***"
./install_vim_ubuntu.sh
echo

echo "*** INSTALLING ZSH: CONFIGURING VM TO USE FIXED IP ***"
./install_network_ubuntu.sh
echo

echo "*** INSTALLING ZSH: INSTALLING ZSH PACKAGE ***"
sudo apt install zsh
touch ~/.zshrc
echo

echo "*** INSTALLING ZSH: SET ZSH AS DEFAULT SHELL ***"
chsh -s $(which zsh)
echo

echo
echo To make zsh as default shell you need to RESTART the VM.
echo Once the VM is rebooted you can contine configuring zsh running: './custom_zsh.sh'
read -p "Press enter to continue"
sudo reboot

