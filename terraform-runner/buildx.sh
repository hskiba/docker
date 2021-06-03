#!/bin/bash
docker buildx build \
       --push \
       --platform linux/arm64,linux/amd64 \
       --tag henryskiba/terraform-runner:latest .
docker buildx build \
       --push \
       --platform linux/arm64,linux/amd64 \
       --tag henryskiba/terraform-runner:0.15.5 .
