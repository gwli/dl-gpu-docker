for i in  cntk mxnet pytorch tensorflow chainer;
do 
   echo "build :$i"
   ./buildcmd.sh $i
done
