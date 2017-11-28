export PARTITION=$1

for i in before_chroot/*;
do 
  echo "excute ... $i"
  . $i
done   


mount /dev/$PARTITION /mnt/$PARTITION
mount -t proc /proc /mnt/$PARTITION/proc
mount --rbind /sys /mnt/$PARTITION/sys
mount --make-rslave /mnt/$PARTITION/sys
mount --rbind /dev /mnt/$PARTITION/dev
mount --make-rslave /mnt/$PARTITION/dev

chroot /mnt/$PARTITION /dl_prep/deploy.sh

