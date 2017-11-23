tagname="victorgwli/$1:pip-cuda-8.0"
nvidia-docker build -t $tagname -f Dockerfile.$1 . && \
docker push  $tagname
