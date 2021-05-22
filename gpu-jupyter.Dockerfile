# Using the NVIDIA Container toolkit for GPU accelerated Datascience
FROM nvidia/cuda:11.3.0-base
MAINTAINER Supreeth Rao
WORKDIR /
RUN apt update && apt install -y --no-install-recommends \
    git \
    build-essential \
    python3-dev \
    python3-pip \
    python3-setuptools
RUN pip3 --no-cache-dir install --upgrade \
    numpy \
    pandas \
    matplotlib \

# Install all required packages
COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt