pacstrap /mnt base base-devel
cat <<'...' >/mnt/etc/pacman.d/mirrorlist
## Japan
Server = http://ftp.tsukuba.wide.ad.jp/Linux/archlinux/$repo/os/$arch
Server = http://ftp.jaist.ac.jp/pub/Linux/ArchLinux/$repo/os/$arch
...

cat <<'EOF' >>/mnt/etc/pacman.conf
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch
EOF
arch-chroot /mnt pacman --noconfirm -S --noconfirm --refresh yaourt
arch-chroot /mnt yaourt --noconfirm -S mutt
arch-chroot /mnt yaourt --noconfirm -S neobundle-git
arch-chroot /mnt yaourt --noconfirm -S ack
arch-chroot /mnt yaourt --noconfirm -S nkf

arch-chroot /mnt pacman -S --noconfirm \
	syslinux openssh sudo \
	virtualbox-guest-modules virtualbox-guest-utils nfs-utils \
	vim docker wget curl rsync screen tmux \
	git tig zsh keychain \
	ranger w3m \
	python2 ansible
