FROM ubuntu:14.04

USER root

#labeling
LABEL maintainer="netiotedge@hilscher.com" \ 
      version="V1.0.0.0" \
      description="Docker development environment for NIOT-E-TIJCX-GB-RE"

#version
ENV HILSCHERNETIOTEDGE_DOCKER_DEV_VERSION 1.0.0.0

#create user "admin" with password "admin"
RUN useradd --create-home --shell /bin/bash admin
RUN echo 'admin:admin' | chpasswd
USER admin
WORKDIR /home/admin

#install and enable SSH
RUN apt-get update  \
    && apt-get install -y openssh-server \
    && service ssh start 
    
#install docker
RUN apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \\
    && add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable" \
    && apt-get update \
    && apt-get install docker-ce

#set the entrypoint
ENTRYPOINT ["/bin/bash"]

#SSH Port
EXPOSE 22
