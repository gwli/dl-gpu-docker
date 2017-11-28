echo install tensorflow
apt-get update && apt-get install -y mesa-utils libglu1-mesa freeglut3 sudo git openssh-server curl python python-dev build-essential wget vim \
    && rm -rf /var/lib/apt/lists/* \
    && cd /root/  && dpkg -i libcudnn6_6.0.21-1+cuda8.0_amd64.deb && dpkg -i libcudnn6-dev_6.0.21-1+cuda8.0_amd64.deb && rm libcudnn*



# Install pip3 first so that pip == pip2 when done.
curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

pip install --no-cache-dir --upgrade  numpy==1.11.0 pexpect psutil future \
         tensorflow-gpu ptvsd scipy tqdm 

