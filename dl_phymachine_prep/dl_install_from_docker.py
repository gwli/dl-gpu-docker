#!/usr/bin/env python2
import argparse
import os


def main(args,sh_cmd="install_from_docker.sh"):
    tml="""
export DL_PYM_DEVICE={0}
export DL_PYM_PARTITION_NUM=1
export DL_PYM_MOUNTPOINT=/mnt/DL$DL_PYM_PARTITION_NUM

echo "format the new partiion $DL_PYM_DEVICE$DL_PYM_PARTITION_NUM"
sudo mke2fs -F -T ext3 $DL_PYM_DEVICE$DL_PYM_PARTITION_NUM
sudo rm -fr $DL_PYM_MOUNTPOINT
sudo mkdir $DL_PYM_MOUNTPOINT
sudo mount $DL_PYM_DEVICE$DL_PYM_PARTITION_NUM $DL_PYM_MOUNTPOINT
docker pull {1} 
sudo docker save {1} | undocker/undocker.py -o $DL_PYM_MOUNTPOINT {1}
sudo grub-install --boot-directory=$DL_PYM_MOUNTPOINT/boot   --force {0}
sudo umount $DL_PYM_DEVICE$DL_PYM_PARTITION_NUM

""".format(args.device,args.img)
    print tml 
    with open(sh_cmd,'w') as f:
       f.write(tml)
    os.system("bash {}".format(sh_cmd))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="deeplearn machine prepre")
    parser.add_argument('--device',help='which device you want to install',required=True, type=str,default="/dev/sda")
    parser.add_argument('--img',type=str,help="docker image name",required=True,default="")
    args = parser.parse_args()
    main(args)

