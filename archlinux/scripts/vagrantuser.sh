# create vagrant user
arch-chroot /mnt groupadd vagrant
arch-chroot /mnt useradd -p $(openssl passwd -crypt 'vagrant') \
	-c 'vagrant user' -g vagrant -G vboxsf,docker -d /home/vagrant \
	-s /bin/bash -m vagrant

# set sudoers
echo -e "Defaults env_keep += \"SSH_AUTH_SOCK\"\nvagrant ALL=(ALL) NOPASSWD: ALL" \
	> /mnt/etc/sudoers.d/vagrant
chmod 0440 /mnt/etc/sudoers.d/vagrant

# create vagrant's home directory
arch-chroot /mnt install -dm0700 -g vagrant -o vagrant /home/vagrant/.ssh
# set vagrant's authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key" \
	> /mnt/home/vagrant/.ssh/authorized_keys
arch-chroot /mnt chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys
arch-chroot /mnt chmod 0600 /home/vagrant/.ssh/authorized_keys
