echo "copy offline package"
sudo true
dst=$DL_PYM_MOUNTPOINT$DL_PYM_INIT_DIR
echo " $DL_PYM_OFFLINE_PKGS_DIR >$dst"
sudo mount $DL_PYM_DEVICE$DL_PYM_PARTITION_NUM $DL_PYM_MOUNTPOINT
sudo rm -fr $dst
echo " $DL_PYM_INIT_PKG ->$dst"
sudo cp -r $DL_PYM_INIT_PKG $dst
echo " $DL_PYM_OFFLINE_PKGS_DIR >$dst/offline_pkgs"
sudo cp -r $DL_PYM_OFFLINE_PKGS_DIR/* $dst/offline_pkgs/*
sudo umount $DL_PYM_DEVICE$DL_PYM_PARTITION_NUM
