# vm-config
Configuration for VM

## VIM
* Go to `scripts` folder.
* Execute the file `install_ubuntu.sh`

## How to use SSHFS to Mount Remote Directories over SSH
Based in https://linuxize.com/post/how-to-use-sshfs-to-mount-remote-directories-over-ssh/#installing-sshfs-on-macos

1. Installing SSHFS on macOS
```
brew cask install osxfuse
brew install sshfs
```

2. Create the folder in mac where the remote ssh will be mount:
```
mkdir ~/sites
mkdir ~/sites/vm-development
```

3. Mounting the Remote File System, once the folder `sites` is created in the VM
```
sshfs developer@192.168.56.10:/home/developer/sites /Users/mariano.martin/sites/vm-development
```

4. Unmounting
```
umount /Users/mariano.martin/sites/vm-development
```
```
diskutil unmount force /Users/mariano.martin/sites/vm-development
```

## Configuring a fix IP to allow easily access using ssh:
14/10/2019 This is no required because is done by the `install_ubuntu.sh` file.
```
# At the end of the file add....
$ sudo vim /etc/network/interfaces
```
```
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
* Download the Cisco Umbrella certificate in the VM: https://docs.umbrella.com/deployment-umbrella/docs/rebrand-cisco-certificate-import-information#section-download-the-certificate
  * https://privacymatters.ubc.ca/sites/privacymatters.ubc.ca/files/Cisco_Umbrella_Root_CA.cer
* Open the terminal in the folder where the certificate was downloaded.
* Run the next commands (`Cisco_Umbrella_Root_CA.cer`is the name for the downloaded certificate):
```
sudo mkdir /usr/local/share/ca-certificates/extra
sudo cp Cisco_Umbrella_Root_CA.cer /usr/local/share/ca-certificates/extra/Cisco_Umbrella_Root_CA.crt
sudo update-ca-certificates
```
## Useful alias for MAC:
#### For mount in local mac the `sites` folder in the VM. (Configuration: [check this](#how-to-use-sshfs-to-mount-remote-directories-over-ssh))
```
ssh_mount_vm='sshfs developer@192.168.56.10:/home/developer/sites /Users/mariano.martin/sites/vm-development'
```
#### Connecting to VM using ssh
```
ssh_vm_docker='ssh developer@192.168.56.10'
```
#### Connecting to VM ussing a ssh tunnel in port 9229 (enable remove debug in `s1_gac_ui`)
```
alias ssh_tunnel_vm='ssh -L 9229:localhost:9229 developer@192.168.56.10'
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
