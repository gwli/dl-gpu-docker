for i in after_chroot/*;
do 
  echo "execute... $i"
  $i

done
