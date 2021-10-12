# Kamatera Docker Macine Driver

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

> This library adds the support for creating [Rancher machines](https://github.com/rancher/machine) hosted on the [Kamatera Cloud](https://www.kamatera.com/).

You need to create a Kamatera access token under `API` > `Keys` in the [Kamatera console](https://console.kamatera.com/keys).

## Deprecation of Docker Machine

Original [Docker Machine](https://github.com/docker/machine) is deprecated, but the [Rancher Machine fork](https://github.com/rancher/machine)
is still maintained. You can download the Rancher machine binary from [Rancher Machine releases](https://github.com/rancher/machine/releases).
It is fully compatible with Docker Machine and can be used to replace it.

## Installation

Download the latest binary for your platform from [Releases](https://github.com/Kamatera/docker-machine-driver-kamatera/releases)

```
wget https://github.com/Kamatera/docker-machine-driver-kamatera/releases/download/v1.1.0/docker-machine-driver-kamatera_v1.1.0_linux_amd64.tar.gz
```

Extract and install

```
tar -xvf docker-machine-driver-kamatera_v1.1.0_linux_amd64.tar.gz
chmod +x docker-machine-driver-kamatera
sudo mv docker-machine-driver-kamatera /usr/local/bin/
```

* The `docker-machine-driver-kamatera` binary should be in your PATH

## Usage

Set your Kamatera api keys in environment variables

```
export KAMATERA_API_CLIENT_ID=
export KAMATERA_API_SECRET=
```

Choose a name for your machine

```
export MACHINE_NAME=my-machine
```

Create the machine

```
rancher-machine create --driver kamatera $MACHINE_NAME
```

SSH into the machine

```
rancher-machine ssh $MACHINE_NAME
```

Use Docker

```
eval $(rancher-machine env $MACHINE_NAME)
docker run hello-world
```

Run rancher-machine operations

```
rancher-machine restart $MACHINE_NAME
rancher-machine stop $MACHINE_NAME
rancher-machine start $MACHINE_NAME
rancher-machine status $MACHINE_NAME
rancher-machine rm $MACHINE_NAME
```

You can enable debugging for all commands by adding `--debug` argument:

```
rancher-machine --debug ARGS...
```

## Create options

The following options / environment variables are available when running rancher-machine create:

- `--kamatera-api-client-id` / `KAMATERA_API_CLIENT_ID`: **required**. Your project-specific access token for the kamatera Cloud API.
- `--kamatera-api-secret` / `KAMATERA_API_SECRET`: **required**. You Kamatera API secret.

Following are additional configuration for creating the Kamatera server:

- `--kamatera-datacenter` / `KAMATERA_DATACENTER` - default: `EU`
- `--kamatera-billing` / `KAMATERA_BILLING` - default: `hourly`
- `--kamatera-cpu` / `KAMATERA_CPU` - default: `1B`
- `--kamatera-ram` / `KAMATERA_RAM` - default: `1024`
- `--kamatera-disk-size` / `KAMATERA_DISK_SIZE` - default: `10`
- `--kamatera-extra-disk-sizes` / `KAMATERA_EXTRA_DISK_SIZES` - default: `` - comma-separated additional disks to create
- `--kamatera-image` / `KAMATERA_IMAGE` - default: `ubuntu_server_18.04_64-bit`
- `--kamatera-private-network-name` / `KAMATERA_PRIVATE_NETWORK_NAME` - default: `` - if not provided, will not attach to a private network
- `--kamatera-private-network-ip` / `KAMATERA_PRIVATE_NETWORK_IP` - default: `` - if not provided, first ip will be used from available private ips
- `--kamatera-script-file` / `KAMATERA_SCRIPT_FILE` - default: `` - path to a startup script
- `--kamatera-tag` - Server tags, can be provided multiple times (example: --kamatera-tag db --kamatera-tag production)
- `--kamatera-userdata-file` / `KAMATERA_USER_DATA_FILE` - default: `` - path to user-data
- `--kamatera-extra-sshkey-file` / `KAMATERA_EXTRA_SSHKEY_FILE` - default: `` - path to SSH public key to add to authorized keys

see [Kamatera server options](https://console.kamatera.com/service/server) for the supported values (must be logged-in to Kamatera console)
