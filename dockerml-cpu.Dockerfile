FROM ubuntu:20.04
MAINTAINER Supreeth Rao <raosupreeth00@gmail.com>
ENV LANG C.UTF-8

RUN sudo apt-get install python-opencv

FROM python:3.9.7-buster
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8888