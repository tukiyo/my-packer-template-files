# Zero out the free space to save space in the final image:
dd if=/dev/zero of=/ZERO bs=1M
rm -f /ZERO
