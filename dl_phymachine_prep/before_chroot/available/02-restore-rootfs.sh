# Format the partition
sudo true
echo "format the new partiion $DL_PYM_DEVICE$DL_PYM_PARTITION_NUM"
sudo mke2fs -F -T ext3 $DL_PYM_DEVICE$DL_PYM_PARTITION_NUM

# copy the rootfs
echo "copy the rootfs"
sudo rm -fr $DL_PYM_MOUNTPOINT
sudo mkdir $DL_PYM_MOUNTPOINT
sudo mount $DL_PYM_DEVICE$DL_PYM_PARTITION_NUM $DL_PYM_MOUNTPOINT
sudo tar -xvpzf $DL_PYM_ROOTFS -C $DL_PYM_MOUNTPOINT --numeric-owner
sudo umount $DL_PYM_DEVICE$DL_PYM_PARTITION_NUM
