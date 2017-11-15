#!/bin/sh

docker build . -t wiztools/gobuild
docker push wiztools/gobuild
