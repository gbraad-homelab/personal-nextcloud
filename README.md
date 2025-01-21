Nextcloud for private/internal use in (Bootable) Containers
===========================================================

```bash
$ podman run -d --name nextcloud --hostname ${HOSTNAME}-nextcloud --net=ncentre-bridge --ip 10.0.21.130  \
    --cap-add=NET_ADMIN --cap-add=NET_RAW --device=/dev/net/tun -v /var/lib/nextcloud:/var/lib/nextcloud \
    ghcr.io/gbraad-homelab/nextcloud:latest
```
