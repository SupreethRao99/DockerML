FROM ubuntu:20.04
MAINTAINER Supreeth Rao <raosupreeth00@gmail.com>
ENV LANG C.UTF-8

RUN APT_INSTALL="apt-get install -y --no-install-recommends" && \
    PIP_INSTALL="python -m pip --no-cache-dir install --upgrade" && \
    GIT_CLONE="git clone --depth 10" && \

    rm -rf /var/lib/apt/lists/* \
           /etc/apt/sources.list.d/cuda.list \
           /etc/apt/sources.list.d/nvidia-ml.list && \

    apt-get update && \
 # --------------- General Tools -----------------------------------------------

    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        build-essential \
        apt-utils \
        ca-certificates \
        wget \
        git \
        vim \
        libssl-dev \
        curl \
        unzip \
        unrar \
        && \

    $GIT_CLONE https://github.com/Kitware/CMake ~/cmake && \
    cd ~/cmake && \
    ./bootstrap && \
    make -j"$(nproc)" install && \

 # --------------- Python  -----------------------------------------------------

        DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        software-properties-common \
        && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        python3.9 \
        python3.9-dev \
        python3-distutils-extra \
        && \
    wget -O ~/get-pip.py \
        https://bootstrap.pypa.io/get-pip.py && \
    python3.9 ~/get-pip.py && \
    ln -s /usr/bin/python3.9 /usr/local/bin/python3 && \
    ln -s /usr/bin/python3.9 /usr/local/bin/python && \
    $PIP_INSTALL \
        setuptools \
        && \
    $PIP_INSTALL \
        Cython \
        cloudpickle \
        einops \
        matplotlib \
        numba \
        numpy \
        pandas \
        scipy \
        scikit-image>=0.14.2 \
        scikit-learn \
        sympy \
        tqdm \
        && \

 # --------------- Jupyter  ----------------------------------------------------
    $PIP_INSTALL \
        jupyter \
        && \
    $PIP_INSTALL \
        jupyterlab \
        && \

# --------------- Tensorflow  --------------------------------------------------
    $PIP_INSTALL \
        tensorflow \
        && \

# --------------- OpenCV -------------------------------------------------------
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
      libatlas-base-dev \
      libgflags-dev \
      libgoogle-glog-dev \
      libhdf5-serial-dev \
      libleveldb-dev \
      liblmdb-dev \
      libprotobuf-dev \
      libsnappy-dev \
      protobuf-compiler \
      && \

    $GIT_CLONE --branch 4.5.2 https://github.com/opencv/opencv ~/opencv && \
    mkdir -p ~/opencv/build && cd ~/opencv/build && \
    cmake -D CMAKE_BUILD_TYPE=RELEASE \
          -D CMAKE_INSTALL_PREFIX=/usr/local \
          -D WITH_IPP=OFF \
          -D WITH_CUDA=OFF \
          -D WITH_OPENCL=OFF \
          -D BUILD_TESTS=OFF \
          -D BUILD_PERF_TESTS=OFF \
          -D BUILD_DOCS=OFF \
          -D BUILD_EXAMPLES=OFF \
          .. && \
    make -j"$(nproc)" install && \
    ln -s /usr/local/include/opencv4/opencv2 /usr/local/include/opencv2 && \

# --------------- PyTorch  -----------------------------------------------------
    $PIP_INSTALL \
        torch \
        && \
    $PIP_INSTALL \
        torchvision \
        && \

# --------------- JAX, FLAX, OPTAX  --------------------------------------------
    $PIP_INSTALL \
        jax \
        && \
    $PIP_INSTALL \
        jaxlib \
        && \
    $PIP_INSTALL \
        flax \
        && \
    $PIP_INSTALL \
        optax \
        && \

# --------------- HuggingFace Transformers  ------------------------------------
    $PIP_INSTALL \
        transformers \
        && \

# --------------- Catalyst -----------------------------------------------------
    $PIP_INSTALL \
        catalyst \
        && \

# --------------- Wandb --------------------------------------------------------
    $PIP_INSTALL \
        wandb \
        && \

# --------------- Optuna -------------------------------------------------------
    $PIP_INSTALL \
        optuna \
        && \

# -------------- ONNX ----------------------------------------------------------
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        protobuf-compiler \
        libprotoc-dev \
        && \

    $PIP_INSTALL \
        --no-binary onnx onnx \
        && \

    $PIP_INSTALL \
        onnxruntime \
        && \

# --------------- Config & Cleanup ---------------------------------------------
    ldconfig && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* ~/*

EXPOSE 8888 6006