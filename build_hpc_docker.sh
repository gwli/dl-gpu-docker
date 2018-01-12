tagname="nvdevtools/hpc-cuda-$1:latest"
nvidia-docker build -t $tagname -f Dockerfile.hpc . && \
docker push  $tagname

