# CPU only
FROM python:3.9.5
MAINTAINER Supreeth Rao <raosupreth00@gmail.com>
WORKDIR /
# Install Python and its tools
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
    jupyter

# Install all required packages
COPY cpu-requirements.txt ./
RUN pip3 install --no-cache-dir -r cpu-requirements.txt