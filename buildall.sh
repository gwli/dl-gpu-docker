for i in chainer cntk mxnet pytorch tensorflow;
do 
   echo "build :$i"
   buildcmd.sh $i
done
