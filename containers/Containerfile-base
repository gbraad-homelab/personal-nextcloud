ARG BASE_IMAGE="quay.io/fedora/fedora"
ARG BASE_VERSION="41"

FROM ${BASE_IMAGE}:${BASE_VERSION} AS base

# install tailscale
RUN dnf config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo \
    && dnf install -y \
        tailscale \
    && dnf clean all \
    && rm -rf /var/cache/yum \
    && mkdir -p /var/run/tailscale /var/cache/tailscale /var/lib/tailscale

# install cloudflared
RUN dnf install -y \
        systemd \
    && curl -fsSL https://github.com/cloudflare/cloudflared/releases/download/2024.12.1/cloudflared-fips-linux-x86_64.rpm -o /tmp/cloudflared.rpm \
    && dnf install -y \
        /tmp/cloudflared.rpm \
    && dnf clean all \
    && rm -rf /var/cache/yum \
    && rm -f /tmp/cloudflared.rpm

# php
RUN dnf install -y php php-fpm php-mysqlnd php-bcmath \
    php-gd php-intl php-ldap php-mbstring php-pdo \
    php-process php-soap php-opcache php-xml \
    php-gmp php-pecl-apcu php-pecl-zip mod_ssl hostname \
    && dnf clean all \
    && rm -rf /var/cache/yum

RUN systemctl enable httpd \
    && systemctl enable tailscaled

# systemd
ENTRYPOINT ["/sbin/init"]
