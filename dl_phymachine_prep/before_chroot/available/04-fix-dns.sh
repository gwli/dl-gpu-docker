echo "infix dns"
sudo true
sudo mount $DL_PYM_DEVICE$DL_PYM_PARTITION_NUM $DL_PYM_MOUNTPOINT
$dns=$DL_PYM_MOUNTPOINT/etc/resolv.conf
sudo rm -fr $dns
sudo echo "nameserver 10.19.185.252" >> $dns
sudo echo "nameserver 10.19.185.253" >> $dns
sudo echo "nameserver 10.19.26.252" >> $dns
sudo umount $DL_PYM_DEVICE$DL_PYM_PARTITION_NUM
