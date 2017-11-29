#!/bin/bash
###
### Script to automatically format all partitions on /dev/sda
### and create a single partition for the whole disk
###


sudo {
# Remove each partition
echo "delete existing paritions"
for v_partition in $(parted -s $DL_PYM_DEVICE print|awk '/^ / {print $1}')
do
   parted -s $DL_PYM_DEVICE rm ${v_partition}
done

# Create single partition
parted -s $DL_PYM_DEVICE mkpart primary 0 ${v_disk}

}
