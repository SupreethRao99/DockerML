# Use a small image with Python pre-installed
FROM python:3.9.5-slim-buster
# Install tensorboard
RUN pip3 install tensorboard