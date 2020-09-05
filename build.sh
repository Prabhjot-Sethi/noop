#!/bin/bash

set -ex

export SB_TOP=$(realpath $(dirname $0))

# build go binary
pushd $SB_TOP/noop
CGO_ENABLED=0 go build -o $SB_TOP/container/_output .
popd

# package into container
pushd $SB_TOP/container
docker build -t psethi/noop:v0.0.1 -f Dockerfile .
popd

