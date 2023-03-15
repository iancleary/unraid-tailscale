#!/usr/bin/env -S just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile test`, for example.

set dotenv-load

# display all the recipes
help:
  just -l

# Make the latest build of the image (version is defined in .env)
build VERSION:
  ./build.sh $IMAGE '{{VERSION}}'

# push the latest version to docker hub (version is defined in make.env)
push VERSION:
  docker push $IMAGE:'{{VERSION}}'
  docker push $IMAGE:$LATEST

# show current version (in .env)
version:
  # version := grep -i "VERSION" .env | cut -d "=" -f2
  echo $VERSION

# bump version to new version
bump TO:
  @#https://www.linode.com/docs/guides/linux-sd-command/

  sd $VERSION '{{TO}}' .env
  sd $VERSION '{{TO}}' README.md

# change to a new version (just change 1.36.2 1.38.0)
change FROM TO:
  @#https://www.linode.com/docs/guides/linux-sd-command/

  sd '{{FROM}}' '{{TO}}' .env
  sd '{{FROM}}' '{{TO}}' README.md
