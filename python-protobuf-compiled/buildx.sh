#!/bin/bash
docker buildx build \
       --push \
       --platform linux/arm64,linux/amd64 \
       --tag henryskiba/python-protobuf-compiled:latest .
docker buildx build \
       --push \
       --platform linux/arm64,linux/amd64 \
       --tag henryskiba/python-protobuf-compiled:3.19.4 .
