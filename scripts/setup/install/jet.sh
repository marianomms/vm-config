
#!/bin/bash
set -e

function install_jet() {
  echo 'Installing Codeship Jet...'

  # jet version to install
  local version=${1:-'2.10.0'}

  wget -q "https://s3.amazonaws.com/codeship-jet-releases/$version/jet-darwin_amd64_$version.tar.gz"

  sudo tar -xC /usr/local/bin/ -f jet-darwin_amd64_$version.tar.gz
  sudo chmod +x /usr/local/bin/jet

  echo ''
  echo 'Jet installed.'
  echo ''

  echo ''
  echo 'Updating jet'
  echo ''
  jet update

  jet version
  rm jet-darwin_amd64_$version.tar.gz
}