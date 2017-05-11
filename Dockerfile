FROM ubuntu:14.04

#labeling
LABEL maintainer="netiotedge@hilscher.com" \ 
      version="V1.0.0.0" \
      description="Docker development environment for NIOT-E-TIJCX-GB-RE"

#version
ENV HILSCHERNETIOTEDGE_DOCKER_DEV_VERSION 1.0.0.0

#install under root
USER root

#create user "admin" with password "admin"
RUN useradd --create-home --shell /bin/bash admin
RUN echo 'admin:admin' | chpasswd

#install and enable SSH
RUN apt-get update  \
    && apt-get install -y openssh-server \
    && service ssh start
    
#install docker prerequisites
RUN apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
    
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \\
    && add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable" \
    && apt-get update \
    && apt-get install -y docker-ce

#SSH Port
EXPOSE 22

#set the entrypoint
CMD ["/usr/sbin/sshd", "-D"]
