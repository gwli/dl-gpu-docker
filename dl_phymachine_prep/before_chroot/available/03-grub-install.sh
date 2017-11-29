sudo {
rm -fr $DL_PYM_MOUNTPOINT
mkdir $DL_PYM_MOUNTPOINT
mount $DL_PYM_DEVICE$DL_PYM_PARTITION_NUM $DL_PYM_MOUNTPOINT
cmd="grub-install --boot-directory=$DL_PYM_MOUNTPOINT/boot $DL_PYM_DEVICE"
echo "$cmd"
$cmd
umount $DL_PYM_DEVICE$DL_PYM_PARTITION_NUM
}

