#!/bin/bash

function redraw_menu() {
  tput clear # clear the screen

  tput cup 3 15 # Move cursor to screen location X,Y (top left is 0,0)

  tput setaf 3 # Set a foreground colour using ANSI escape
  echo "Interactive Environment Setup"
  tput sgr0

  tput cup 5 15
  echo "1. AWS CLI $aws_setup_result"
  tput cup 6 15
  echo "2. Git & GitHub $git_setup_result"
  tput cup 7 15
  echo "3. Install codeship jet $jet_setup_result"

  tput cup 10 15
  echo "9. Print Versions"
  tput cup 11 15
  echo "0. Exit"

  tput bold # Set bold mode
  tput cup 13 15
  read -p "Enter your choice [0-9]: " main_menu_choice

  tput clear
  tput sgr0
  tput rc
}

function print_versions() {
  docker -v
  docker-compose --version
  aws --version
  git --version
  git config --global --list
  echo "vscode version: $(code --version | head -n 1)"
  JET_VERSION="$(jet version)"
  if [ -z "$JET_VERSION" ]; then
    echo "*** jet not installed ***"
  else
    echo "jet version $JET_VERSION"
  fi
}

while true; do
  redraw_menu

  case $main_menu_choice in
  1)
    source ./scripts/setup/configure/awscli.sh
    setup_awscli
    aws_setup_result=": (done)"
    ;;
  2)
    echo Please, configure manually github access
    #   source /home/developer/.config/s1_setup_scripts/configure/git.sh
    #   setup_git
    #   git_setup_result=": (done)"
    ;;
  3)
    source ./scripts/setup/install/jet.sh
    install_jet
    jet_setup_result=": (done)"
    ;;
  9)
    print_versions
    ;;
  0)
    exit 0
    ;;
  *)
    echo "Unknown choice"
    ;;
  esac

  read -p "Press [Enter] to Continue"
done

clear
