#!/bin/bash

source ./docker_build.sh
docker run --rm -p 1025:1025 -p 1080:1080 $DOCKER_IMAGE_NAME