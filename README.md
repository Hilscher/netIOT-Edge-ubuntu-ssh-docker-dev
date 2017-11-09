## Edge Gateway for the IT/OT convergence - NIOT-E-TIJCX-GB

For platform details read on [here](https://www.netiot.com/netiot/netiot-edge/).

### Ubuntu with SSH, Docker and Git as container development environment

The image provided hereunder deploys a container with installed Docker and Git to be used as container development environment.

Base of this image builds a tagged version of [ubuntu](https://hub.docker.com/r/library/ubuntu/tags/14.04/) with enabled [SSH](https://en.wikipedia.org/wiki/Secure_Shell), a fully featured [Docker environment](https://www.docker.com/) and [Git](https://git-scm.com/) version control system.

#### Container prerequisites

##### Port mapping

The image SSH port `22` needs to be mapped to an unused gateway port, e.g. `22` to be available for remote access.

##### Privileged mode

Only the privileged mode option lifts the enforced container limitations to allow usage of Docker in a container.

#### Container start

Pulling the image from Docker Hub may take up to 5 minutes average. 

#### Getting started

STEP 1. Open the gateway's landing page under `https://<gateways's ip address>`. 

STEP 2. Click the Docker tile to open the [Portainer.io](http://portainer.io/) Docker management user interface. 

STEP 3. Enter the following parameters under **Containers > Add Container**

* **Image**: `hilschernetiotedge/netiot-edge-ubuntu-ssh-docker-dev`

* **Restart policy**: `always`

* **Port mapping**: `Host: 22 -> Container: 22`

* **Runtime > Privileged mode** : `On`

STEP 4. Press the button **Actions > Start container**

#### Accessing

The container starts the SSH service and the Docker daemon automatically. 

Login to it with an SSH client such as [putty](http://www.putty.org/) using the gateway's IP address along with the mapped SSH port. Use the credentials `root` as user and `root` as password when asked and you are logged in as root.

Use [Docker CLI](https://docs.docker.com/engine/reference/commandline/docker/) commands as usual.

### GitHub sources
The image is built from the GitHub project [netiot-edge-ubuntu-ssh-docker-dev](https://github.com/Hilscher/netIOT-Edge-ubuntu-ssh-docker-dev). It complies with the [Dockerfile](https://docs.docker.com/engine/reference/builder/) method to build a Docker image [automated](https://docs.docker.com/docker-hub/builds/). 

   
[![N|Solid](http://www.hilscher.com/fileadmin/templates/doctima_2013/resources/Images/logo_hilscher.png)](http://www.hilscher.com)  Hilscher Gesellschaft fuer Systemautomation mbH  www.hilscher.com
