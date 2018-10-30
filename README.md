# vm-config
Configuration for VM

## VIM
1. Using as plugin manager [Vundler](https://github.com/VundleVim/Vundle.vim)
2. Before installl plugin we need to install the plugins dependencies:
    #### Mac OS X
    `brew install cmake`
    #### Ubuntu 
    `sudo apt install build-essential cmake python3-dev`    
3. Once `vim` is opened run `:PluginInstall` to install all the plugins. The first time that `vim` is opened (before install the plugins) and `No Color Scheme found` error is shown, ignore it.
4. Complete the `YouCompleteMe` installation:
    ```
    cd ~/.vim/bundle/YouCompleteMe
    ./install.py
    ```

## Interesting Link
1. Editing your `/etc/hosts file, to use from local the VM: https://github.com/Sage/s1_documentation/blob/master/development_environment/experimental/network_setup.md#editing-your-etchosts-file
2. Using iterm2 as VM terminal using `tmux`
https://github.com/Sage/s1_documentation/blob/master/development_environment/experimental/tmux-control-mode.md#using-iterm2-as-your-peppermint-terminal
