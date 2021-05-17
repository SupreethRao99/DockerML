# NVIDIA CUDA image as a base
FROM nvidia/cuda:11.3.0-runtime
WORKDIR /
# Install Python and its tools
RUN apt update && apt install -y --no-install-recommends \
    git \
    build-essential \
    python3-dev \
    python3-pip \
    python3-setuptools
RUN pip3 -q install pip --upgrade

# Install all required packages
COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt
