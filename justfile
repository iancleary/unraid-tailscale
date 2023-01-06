#!/usr/bin/env -S just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile test`, for example.

set dotenv-load

# display all the recipes
help:
  just -l

# Make the latest build of the image (version is defined in .env)
build:
  ./build.sh $IMAGE $VERSION

# push the latest version to docker hub (version is defined in make.env) 
push: 
  docker push $IMAGE:$VERSION
  docker push $IMAGE:$LATEST

# change to a new version (just change 1.34.2 1.34.3)
change FROM TO:
  @#https://www.linode.com/docs/guides/linux-sd-command/
  sd '{{FROM}}' '{{TO}}' .env
  sd '{{FROM}}' '{{TO}}' README.md
