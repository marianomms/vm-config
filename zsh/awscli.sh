#!/bin/bash

function setup_awscli(){
  clear
  tput bold       # Set bold mode
  echo "Configuring AWS"
  tput sgr0

  mkdir ~/.aws/
  printf "[default]\noutput = json\nregion = eu-west-1" > ~/.aws/config

  aws configure

  echo ""
  tput bold       # Set bold mode
  echo 'Setup complete'
  tput sgr0
}

setup_awscli
