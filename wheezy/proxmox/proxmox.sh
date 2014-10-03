cat > /etc/apt/sources.list.d/proxmox.list <<...
deb http://download.proxmox.com/debian wheezy pve-no-subscription
...

wget -q -O- "http://download.proxmox.com/debian/key.asc" | apt-key add -

apt-get update
apt-get dist-upgrade -y
apt-get install -y pve-kernel-2.6.32-33-pve pve-firmware

sed -i \
  -e 's/GRUB_DEFAULT=0/GRUB_DEFAULT=2/' \
  -e 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=1/' \
  /etc/default/grub

/usr/sbin/update-grub2

cat > /etc/network/interfaces <<...
auto lo
iface lo inet loopback

iface eth0 inet manual

auto vmbr0
iface vmbr0 inet static
    address  10.0.2.15
    netmask  255.255.255.0
    gateway  192.168.11.1
    dns-nameservers 10.0.2.3
    #
    bridge_ports eth0
    bridge_stp off
    bridge_fd 0
    #
    pre-up sed -i -e "s/127.0.1.1/10.0.2.15/" /etc/hosts
...

reboot
sleep 120
