
export DL_PYM_DEVICE=/dev/sda
export DL_PYM_PARTITION_NUM=1
export DL_PYM_OFFLINE_PKGS_DIR=offline_pkgs
export DL_PYM_MOUNTPOINT=/mnt/DL$DL_PYM_PARTITION_NUM
export DL_PYM_INIT_DIR=/dl_init
export DL_PYM_INIT_PKG=./dl_init
export DL_PYM_ROOTFS=ubuntu160403rootfs_2017_11_29_nv.tgz
export DL_PYM_CONFIG=default

sudo true

for i in before_chroot/$DL_PYM_CONFIG/*;
do 
  echo "excute ... $i"
  #. $i
done   

exit
sudo mount $DL_PYM_DEVICE$DL_PYM_PARTITION_NUM $DL_PYM_MOUNTPOINT
sudo mount -t proc /proc   $DL_PYM_MOUNTPOINT/proc
sudo mount --rbind /sys    $DL_PYM_MOUNTPOINT/sys
sudo mount --make-rslave   $DL_PYM_MOUNTPOINT/sys
sudo mount --rbind /dev    $DL_PYM_MOUNTPOINT/dev
sudo mount --make-rslave   $DL_PYM_MOUNTPOINT/dev

sudo chroot $DL_PYM_MOUNTPOINT $DL_PYM_INIT_DIR/deploy.sh $DL_PYM_CONFIG

