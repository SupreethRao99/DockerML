FROM continuumio/miniconda3
MAINTAINER Supreeth Rao <raosupreeth00@gmail.com>
ENV LANG C.UTF-8
RUN conda config --add channels conda-forge
RUN conda config --set channel_priority strict
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8888
