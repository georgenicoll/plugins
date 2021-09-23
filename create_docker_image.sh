#!/usr/bin/env bash
echo "Creating docker image..."
docker build --squash -t georgenicoll/containernetworking-dhcp .
echo "Pushing image to docker hub (need to be logged in with 'docker login' for this to work)..."
docker push georgenicoll/containernetworking-dhcp
