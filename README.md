
Easy Podman helps you easily work around with containers 


###  🔨  Installation ###

```sh
git clone git@github.com:sabuhish/easy-podman-cli.git

cd easy-podman-cli

./podman.sh

```
or 
```sh

sudo su

curl -LO https://raw.githubusercontent.com/sabuhish/easy-podman-cli/master/podman.sh && bash podman.sh

```


### 🕹 Guide

```bash

easy-podman  --help 

```

### Available Comands
```bash

build-podman  
down-podman
connect-podman 
dangling-podman
restart-podman
restart-podman-compose
podman-compose-logs


```


### Usage ###

```bash

build-podman  
Building multi-containers.  Building multi-containers. Comand should given where your docker-compose file exist

down-podman
Stoping runnig multi-containers in the directory

connect-podman 
Executing inside running container with execution type, arguments required.
ex: connect-podman ID  bash

dangling-podman
This comand removes inactive containers and stalled images


restart-podman
Restarting container, argument required

restart-podman-compose
Restarting podman-compose

podman-compose-logs
Logs for running multi-containers

```
## Supported OS
Linux, MacOS

## 🌱 Contributing
Fell free to open issue and send pull request.


## License
[MIT](https://github.com/sabuhish/easy-podman-cli/blob/master/LICENSE)