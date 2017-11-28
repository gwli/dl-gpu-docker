mount /dev/sda1 /mnt/sda1
mount -t proc /proc /mnt/sda1/proc
mount --rbind /sys /mnt/sda1/sys
mount --make-rslave /mnt/sda1/sys
mount --rbind /dev /mnt/sda1/dev
mount --make-rslave /mnt/sda1/dev

chroot /mnt/sda1 /bin/bash
