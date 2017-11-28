sudo true
#sudo tar -cvpz --one-file-system / | ssh test@10.19.226.133 "(cat >/raid/work/`lsb_release -d |cut -f 2,3 |tr " " ""`rootfs`date +%Y%M%d_%H%m%S`.tgz)"
# ./tarrootfs test 10.19.226.133 /raid/work/
os_release=`lsb_release -d |cut -f 2,3 |tr " " "_"`
echo $os_release
#sudo tar -cvpz --one-file-system / | ssh $1@$2 "(cat >$3${os_release}rootfs`date +%Y%M%d_%H%m%S`.tgz)"
echo tar -cvpz --one-file-system / | ssh $1@$2 "(cat >$3${os_release}rootfs`date +%Y%M%d_%H%m%S`.tgz)"
