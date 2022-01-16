# dockerized-openvpn
Dockerized OpenVPN

Run OpenVPN inside a docker conyainer with Mozilla Firefox.

Firefox start with a clean state each time. (INCOGNITO)

## Requirements

- Docker or Podman
- OpenVPN Client Config file (.ovpn file)
- output of `id -u` to be added to `Dockerfile` as EXECUID
- output of `id -g` to be added to `Dockerfile` as EXECGID
- desired username for user to be added inside the container as EXECUSER in `Dockerfile`

## Invocation

How to start Dockerized OpenVPN

1. Build Docker Image : `bash docker-image-build.sh`
2. Download your OpenVPN Client config file (.ovpn) and rename it to `openvpn.conf`
3. Copy the `openvpn.conf` to the `openvpn` directory.
4. Start the dockerized openvpn conatiner : `bash run.sh firefox`


## Warning

This software is FREELY available under GNU/GPL v3.
EXCEPT AS EXPRESSLY PROVIDED IN THIS AGREEMENT, NEITHER PARTY MAKES ANY OTHER REPRESENTATION OR WARRANTY, EXPRESS OR IMPLIED, EITHER IN FACT OR BY OPERATION OF LAW, STATUTE, OR OTHERWISE, AND EACH PARTY SPECIFICALLY DISCLAIMS ANY AND ALL IMPLIED OR STATUTORY WARRANTIES INCLUDING WARRANTIES OF MERCHANTABILITY AND OF FITNESS FOR A PARTICULAR PURPOSE.

# SOURCE

The source used in this repo is originally taken from `https://github.com/oseiskar/docker-vpn-browser.git`
I have customized and corrected it to meet my requirements.

## References

- http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/
- https://stackoverflow.com/questions/16296753/can-you-run-gui-applications-in-a-linux-docker-container
