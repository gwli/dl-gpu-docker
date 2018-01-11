tagname="nvdevtools/hpc-cuda-$1:latest -f Dockerfile.hpc .
nvidia-docker build -t $tagname -f Dockerfile.hpc . && \
docker push  $tagname

