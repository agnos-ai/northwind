#!/usr/bin/env bash

_IMAGE_NAME="docker.io/agnosai/rdfox-rules"
_IMAGE_VERSION="latest"
_MANUALLY_INCREMENTED_IMAGE_VERSION="5.5"

docker build . \
  --iidfile=image.id \
  "--tag=${_IMAGE_NAME}:${_IMAGE_VERSION}" \
  "--tag=${_IMAGE_NAME}:${_MANUALLY_INCREMENTED_IMAGE_VERSION}"
exit $?
