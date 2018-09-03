#!/bin/bash
# Specify the exact version of sitespeed.io. When you upgrade to the next version, pull it down and the chage the tag
DOCKER_CONTAINER=sitespeedio/sitespeed.io:7.3.6

# Setup the network and default ones we wanna use
sudo /home/ubuntu/startNetworks.sh
THREEG="--network 3g"
CABLE="--network cable"

# Simplify some configurations
CONFIG="--config ./default.json"
DOCKER_SETUP="--shm-size=1g --rm -v ./config:/sitespeed.io -v ./result:/result -v /etc/localtime:/etc/localtime:ro --name sitespeed"

# Start running the tests
# We run more tests on our test server but this gives you an idea of how you can configure it
docker run $CABLE $DOCKER_SETUP $DOCKER_CONTAINER -n 11 --browsertime.viewPort 1920x1080 --browsertime.cacheClearRaw --browsertime.chrome.collectTracingEvents /sitespeed.io/wikipedia.org.txt $CONFIG
docker run $CABLE $DOCKER_SETUP $DOCKER_CONTAINER -n 11 --browsertime.viewPort 1920x1080 /sitespeed.io/wikipedia.org.txt -b firefox $CONFIG
docker run $THREEG $DOCKER_SETUP $DOCKER_CONTAINER --graphite.namespace sitespeed_io.emulatedMobile --browsertime.chrome.collectTracingEvents /sitespeed.io/m.wikipedia.org.txt -c 3g --mobile true $CONFIG

# We remove all docker stuff to get a clean next run
docker system prune --all --volumes -f

# Get the container so we have it the next time we wanna use it
docker pull $DOCKER_CONTAINER