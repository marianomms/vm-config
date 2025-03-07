# Not needed now because they are installed via brew
# Now this is done in each script file
# echo "*** CUSTOM ZSH: INSTALLING  zsh-syntax-highlighting ***"
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
# echo

# echo "*** CUSTOM ZSH: INSTALLING  zsh-syntax-highlighting ***"
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
# echo

# echo "*** CUSTOM ZSH: FINAL CUSTOMIZATION FOR ZSH ***"
# sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

cp -r ../zsh/. ~/
rm ~/README.md
