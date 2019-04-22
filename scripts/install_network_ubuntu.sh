echo "### Configuring network to use IP fixed"

sudo sh -c 'echo "# Local Interface (for SSH)" >> /etc/network/interfaces'
sudo sh -c 'echo "auto enp0s8" >> /etc/network/interfaces'
sudo sh -c 'echo "iface enp0s8 inet static" >> /etc/network/interfaces'
sudo sh -c 'echo "address 192.168.56.10" >> /etc/network/interfaces'
sudo sh -c 'echo "netmask 255.255.255.0" >> /etc/network/interfaces'

sudo ifup enp0s8

echo "### Completed configuration network to use IP fixed"

