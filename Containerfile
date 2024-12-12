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

# php
RUN dnf install -y php php-fpm php-mysqlnd php-bcmath \
    php-gd php-intl php-ldap php-mbstring php-pdo \
    php-process php-soap php-opcache php-xml \
    php-gmp php-pecl-apcu mod_ssl hostname \
    && dnf clean all \
    && rm -rf /var/cache/yum

ENTRYPOINT ["/sbin/init"]
