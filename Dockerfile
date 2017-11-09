#use fixed ubuntu version
FROM ubuntu:14.04

#labeling
LABEL maintainer="netiotedge@hilscher.com" \ 
      version="V1.1.0.0" \
      description="Containerized Docker for onboard container developments"

#version
ENV HILSCHERNETIOTEDGE_UBUNTU_SSH_DOCKER_DEV_VERSION 1.1.0.0

#execute all commands as root
USER root

#install SSH 
RUN apt-get update  \
    && apt-get install -y openssh-server

#do users
RUN echo 'root:root' | chpasswd \
    && sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd \
    && mkdir /var/run/sshd 

#copy needed files from repro
COPY "entrypoint.sh" /
RUN chmod +x entrypoint.sh

#install docker prerequisites
RUN apt-get install -y \
    git \
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

#the entrypoint is starting ssh
ENTRYPOINT ["/entrypoint.sh"]
