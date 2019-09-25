# vm-config
Configuration for VM

## VIM
Use the `scripts/install_vim_ubuntu.sh` file to install vim.

## Configuring a fix IP to allow easily access using ssh:
    ```
    # At the end of the file add....
    $ sudo vim /etc/network/interfaces
    # Local Interface (for SSH)
    auto enp0s8
    iface enp0s8 inet static
    address 192.168.56.10
    netmask 255.255.255.0
    ```

    ```
    $ sudo ifup enp0s8
    ```
    
    Restart the virtual machine.
## Adding Umbrella certificate to VM
```
sudo mkdir /usr/local/share/ca-certificates/extra
sudo cp root.cert.pem /usr/local/share/ca-certificates/extra/root.cert.crt
sudo update-ca-certificates
```

## Interesting Link
1. VM Guide: https://github.com/Sage/s1_documentation/blob/master/development_environment/setup.md
2. Editing your `/etc/hosts` file, to use from local the VM:
    https://github.com/Sage/s1_documentation/blob/master/development_environment/experimental/network_setup.md#editing-your-etchosts-file
3. Using iterm2 as VM terminal using `tmux`
    https://github.com/Sage/s1_documentation/blob/master/development_environment/experimental/tmux-control-mode.md#using-iterm2-as-your-peppermint-terminal
4. Configure internal network between mac and VM to use a fix IP
    https://gist.github.com/wacko/5577187#gistcomment-2101321
    
-  The mysql config in vm is (port: 3322): https://github.com/Sage/s1_gac_addons_test/blob/master/config/global/common.env#L8
