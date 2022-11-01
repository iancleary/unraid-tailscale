#!/usr/bin/env bash

VERSION=$1
DEV=$2

if [ -z "${VERSION}" ] 
then
 exit "build.sh <version>"
fi

if [[ -z "${DEV}" || "${DEV}" != "dev" ]]
then 
    DEV_BUILD=0
    FULL_TAG=${VERSION}
    echo "Building prod"
else
    DEV_BUILD=1
    FULL_TAG="dev-${VERSION}"
    echo "Building dev"
fi

docker build --no-cache --build-arg VERSION=$VERSION -t iancleary/unraid-tailscale:${FULL_TAG} .

ret=$?
if [ $ret -ne 0 ]; then
	echo "Build failed"
	exit 1;
fi

docker tag iancleary/unraid-tailscale:${FULL_TAG}

if [ $DEV_BUILD != 1 ];
then
   docker tag iancleary/unraid-tailscale:${FULL_TAG} iancleary/unraid-tailscale:latest
else
    docker push iancleary/unraid-tailscale:${FULL_TAG}
fi