#!/usr/bin/env python2
import argparse
import os


def main(args,sh_cmd="install.sh"):
    tml="""
export DL_PYM_DEVICE={0}
export DL_PYM_PARTITION_NUM=1
export DL_PYM_OFFLINE_PKGS_DIR={3}
export DL_PYM_MOUNTPOINT=/mnt/DL$DL_PYM_PARTITION_NUM
export DL_PYM_INIT_DIR=/dl_init
export DL_PYM_INIT_PKG=./dl_init
export DL_PYM_ROOTFS={1}
export DL_PYM_CONFIG={2}

sudo true

for i in before_chroot/$DL_PYM_CONFIG/*;
do 
  echo "excute ... $i"
  . $i
done   

exit
sudo mount $DL_PYM_DEVICE$DL_PYM_PARTITION_NUM $DL_PYM_MOUNTPOINT
sudo mount -t proc /proc   $DL_PYM_MOUNTPOINT/proc
sudo mount --rbind /sys    $DL_PYM_MOUNTPOINT/sys
sudo mount --make-rslave   $DL_PYM_MOUNTPOINT/sys
sudo mount --rbind /dev    $DL_PYM_MOUNTPOINT/dev
sudo mount --make-rslave   $DL_PYM_MOUNTPOINT/dev

sudo chroot $DL_PYM_MOUNTPOINT $DL_PYM_INIT_DIR/deploy.sh $DL_PYM_CONFIG

""".format(args.device,args.rootfs,args.config,args.pkgs)
    print tml 
    with open(sh_cmd,'w') as f:
       f.write(tml)
    os.system("bash {}".format(sh_cmd))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="deeplearn machine prepre")
    parser.add_argument('--device',help='which device you want to install',required=True, type=str,default="/dev/sda")
    parser.add_argument('--rootfs',type=str,help="rootfs tar package",required=True,default="")
    parser.add_argument('--pkgs',type=str,help="offline packages",default="./offline_pkgs")
    parser.add_argument('--config',help='what tools you want to install: tensorflow(default)/mxnet/pytorch/chainer/cntk',type=str, required=True,default='default')
    args = parser.parse_args()
    main(args)

