#!/usr/bin/env bash

IMAGE=$1
VERSION=$2
DEV=$3

echo "$IMAGE:$VERSION"

if [ -z "${VERSION}" ] 
then
 exit "build.sh <version>"
fi

if [ -z "${IMAGE}" ]
then
 exit "build.sh <image>"
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

docker build --no-cache --build-arg VERSION=$VERSION -t ${IMAGE}:${FULL_TAG} .

ret=$?
if [ $ret -ne 0 ]; then
	echo "Build failed"
	exit 1;
fi

docker tag ${IMAGE}:${FULL_TAG}

if [ $DEV_BUILD != 1 ];
then
   docker tag ${IMAGE}:${FULL_TAG} ${IMAGE}:latest
else
    docker push ${IMAGE}:${FULL_TAG}
fi