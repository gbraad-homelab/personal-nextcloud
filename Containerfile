ARG BASE_IMAGE="quay.io/fedora/fedora"   # "fedora-bootc"
ARG BASE_VERSION="40"

FROM ${BASE_IMAGE}:${BASE_VERSION} AS base
