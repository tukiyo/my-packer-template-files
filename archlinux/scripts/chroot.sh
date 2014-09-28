arch-chroot /mnt syslinux-install_update -i -m
sed -e 's/sda3/sda1/g' \
	-e 's/TIMEOUT.*/TIMEOUT 05/' \
	-i /mnt/boot/syslinux/syslinux.cfg
genfstab -p /mnt >> /mnt/etc/fstab

# basic configuration
echo 'archlinux.vagrant' > /mnt/etc/hostname
echo 'KEYMAP=jp106' > /mnt/etc/vconsole.conf
sed -i -e 's/#en_US.UTF-8/en_US.UTF-8/' -e 's/#ja_JP.UTF-8/ja_JP.UTF-8/' /mnt/etc/locale.gen
sed -e 's/#UseDNS.*/UseDNS no/' -i /mnt/etc/ssh/sshd_config
echo -e "vboxguest\nvboxsf\nvboxvideo" \
	> /mnt/etc/modules-load.d/virtualbox-modules.conf
arch-chroot /mnt locale-gen
arch-chroot /mnt ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
arch-chroot /mnt mkinitcpio -p linux
# Disable Predictable Network Interface Name
arch-chroot /mnt ln -s /dev/null /etc/udev/rules.d/80-net-setup-link.rules
arch-chroot /mnt systemctl enable 'dhcpcd@eth0.service'
arch-chroot /mnt systemctl enable 'sshd.service'
arch-chroot /mnt systemctl enable 'vboxservice.service'
