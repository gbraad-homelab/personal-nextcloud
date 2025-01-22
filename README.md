Nextcloud for private/internal use in (Bootable) Containers
===========================================================

### Container

```bash
$ podman run -d --name nextcloud --hostname ${HOSTNAME}-nextcloud --net=ncentre-bridge --ip 10.0.21.130  \
    --cap-add=NET_ADMIN --cap-add=NET_RAW --device=/dev/net/tun -v /var/lib/nextcloud:/var/lib/nextcloud \
    ghcr.io/gbraad-homelab/nextcloud:latest
```

### Virtual Machine

```
$ wget https://github.com/gbraad-homelab/personal-nextcloud/releases/download/latest/disk.qcow2 -O nextcloud.qcow2
$ sudo virt-install \
    --name nextcloud --os-variant fedora-eln \
    --cpu host --vcpus 4 --memory 4096 \
    --import --disk ./nextcloud.qcow2,format=qcow2
```
