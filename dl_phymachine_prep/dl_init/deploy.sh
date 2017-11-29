echo "after chroot"
sudo true
for i in after_chroot/$1/*;
do 
  echo "execute... $i"
  $i

done
