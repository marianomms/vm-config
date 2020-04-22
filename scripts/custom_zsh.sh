echo "*** CUSTOM ZSH: INSTALLING Oh My Zsh ***"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
zsh
echo

echo "*** CUSTOM ZSH: INSTALLING  zsh-syntax-highlighting ***"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
echo

echo "*** CUSTOM ZSH: INSTALLING  zsh-syntax-highlighting ***"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo

echo "*** CUSTOM ZSH: FINAL CUSTOMIZATION FOR ZSH ***"
sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

cp -r ../zsh/. ~/
echo 'source ~/.zshrc_mms' >> ~/.zshrc
