# Install zsh
sudo apt install zsh
# Push zsh as default shell
chsh -s /usr/bin/zsh root

# Download oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
source ~/.zshrc

cp -r ../zsh/. ~/
echo 'source ~/.zshrc_mms' >> ~/.zshrc

