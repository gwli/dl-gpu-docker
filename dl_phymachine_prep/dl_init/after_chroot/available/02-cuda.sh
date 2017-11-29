echo install cuda

cuda_repo=`ls /dl_init/offline_pkgs/cuda-repo*`

sudo dpkg -i $cuda_repo
sudo apt update && apt install -y cuda-toolkit-8-0
sudo dpkg -i  /dl_init/offline_pkgs/libcudnn6_*.deb
sudo dpkg -i  /dl_init/offline_pkgs/libcudnn6-dev*.deb
