#!/bin/bash

CUR_DIR=$(dirname $(readlink -f $0))

GIT_VOL=""
# runs the test-formula Docker container

docker run \
    --interactive=true \
    --tty=true \
    -v "$CUR_DIR/minion":/etc/salt/minion \
    -v "$CUR_DIR/pillar":/srv/pillar/ \
    -v "$CUR_DIR/salt":/srv/salt/ \
    -v "$GIT_VOL":/git \
    test-formula \
    $*
