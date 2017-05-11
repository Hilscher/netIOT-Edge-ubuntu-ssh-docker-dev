## NIOT-E-TIJCX-GB-RE
### netIOT Edge gateway for Automation networks as Docker host

netIOT Edge devices from Hilscher securely connect automation networks with cloud or IoT directed application. On the OT network side they are in cyclic I/O data exchange with a PLC while communicating with IoT-capable field devices directly at the same time over IOT protocols such as MQTT or OPC UA. On the IT network side they exchange those key field data with intelligent higher-level applications of cyber-physical systems and M2M solutions.

The Edge Gateway NIOT-E-TIJCX-GB-RE comes with support out of the box for using Docker as a host. This feature enables gateway users to expand the range of default functions with their own dockerized applications. 

### The image

The image provided hereunder gives you the possibility to compile Docker images on the gateway in an Ubuntu based environment to let them run on the gateway afterwards.

#### Ubuntu

The base for the image root filesystem is the [Ubuntu](https://hub.docker.com/r/library/ubuntu/tags/latest/).

#### SSH 

By default Ubuntu does not have SSH installed. SSH is activated in the image for an improve usability from remote over Ethernet. The default SSH login name is "admin" and the password is "admin"

#### Docker

The image comes with a full featured [Docker environment](https://www.docker.com/) installed. All [Docker Commands](https://docs.docker.com/engine/reference/commandline/docker/) are available via the (SSH) console. 

### Container prerequisites
#### Volumes

In order to deploy on-board builds from the Container to the gateway's Docker host its deamon socket `/var/run/docker.sock` needs to be exposed to Docker host using the bind-mounting option when the container is started.

#### Port mapping

The image SSH port `22` needs to be mapped to an usued gateway port, e.g. `10000` to be available for remote access.

### Container start

Pulling the image from Docker Hub may take up to 5 minutes average. 

#### On NIOT-E-TIJCX-GB-RE

STEP 1. Open NIOT-E-TIJCX-GB-RE's landing page under `https://<gateways's ip address>`. 

STEP 2. Click the Docker tile to open the [Portainer.io](http://portainer.io/) Docker management user interface. 

STEP 3. Enter the following parameters under **Containers > Add Container**

* **Image**: `hilscher/netiot-edge-ubuntu-ssh-docker-dev`

* **Restart policy**: `always`

* **Port mapping**: `Host: 10000 -> Container: 22`

* **Advanced container settings > Command > Console**: `Interactive && TTY`checked

* **Advanced container settings > Volumes > map additional volume**: `Container: /var/run/docker.sock, bind -> Host: /var/run/docker.sock `

STEP 4. Press the button **Actions > Start container**

### GitHub sources
The image is built from the GitHub project [netIOT-Edge-ubuntu-ssh-docker-dev](https://github.com/Hilscher/netIOT-Edge-ubuntu-ssh-docker-dev). It complies with the [Dockerfile](https://docs.docker.com/engine/reference/builder/) method to build a Docker image [automated](https://docs.docker.com/docker-hub/builds/). 


### References:

* https://github.com/hilschernet/netIOT-Edge-ubuntu-ssh-docker-dev
* https://docs.docker.com/engine/reference/commandline/docker/
* http://portainer.io/
* https://hub.docker.com/r/library/ubuntu/tags/latest/
* https://docs.docker.com/engine/reference/builder/
* https://docs.docker.com/docker-hub/builds/
    
[![N|Solid](http://www.hilscher.com/fileadmin/templates/doctima_2013/resources/Images/logo_hilscher.png)](http://www.hilscher.com)  Hilscher Gesellschaft für Systemautomation mbH  www.hilscher.com

