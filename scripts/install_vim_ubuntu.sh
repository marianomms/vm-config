cp -r ../vim/. ~/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# YouCompleteMe  prerequisites
sudo apt install build-essential cmake python3-dev
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
python3 install.py

