# remove caches
yes | arch-chroot /mnt pacman -Scc

# disable root user
arch-chroot /mnt passwd root -l
