apt-get install -y \
 proxmox-ve-2.6.32 ntp ssh lvm2 ksm-control-daemon vzprocps open-iscsi bootlogd screen

#DEBIAN_FRONTEND=noninteractive \
#apt-get install -y postfix

sed -i -e 's/^/#/' /etc/apt/sources.list.d/proxmox.list
apt-get update

pveam update

apt-get remove -y linux-image-amd64 linux-image-3.2.0-4-amd64
sed -i \
  -e 's/GRUB_DEFAULT=2/GRUB_DEFAULT=0/' \
  /etc/default/grub

/usr/sbin/update-grub2
