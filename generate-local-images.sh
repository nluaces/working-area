#! /bin/sh

make clean
make all

podman build -t quay.io/nluaces/service-controller:latest -f Dockerfile.service-controller
podman build -t quay.io/nluaces/config-sync:latest -f Dockerfile.config-sync
podman build -t quay.io/nluaces/flow-collector:latest -f Dockerfile.flow-collector
podman build -t quay.io/nluaces/controller-podman:latest -f Dockerfile.controller-podman

podman push quay.io/nluaces/service-controller
podman push quay.io/nluaces/config-sync
podman push quay.io/nluaces/flow-collector
podman push quay.io/nluaces/controller-podman

cp skupper ~/.local/bin/skupper
sudo cp skupper /usr/local/bin/skupper
