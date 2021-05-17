# Use a small image with Python pre-installed
FROM python:3.9.5-slim-buster
MAINTAINER Supreeth Rao <raosupreeth00@gmail.com>
# Install tensorboard
RUN pip3 install tensorboard