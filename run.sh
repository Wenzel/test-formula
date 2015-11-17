#!/bin/bash

CUR_DIR=$(dirname $(readlink -f $0))

docker run \
    --interactive=true \
    --tty=true \
    -v "$CUR_DIR/minion":/etc/salt/minion \
    -v "$CUR_DIR/pillar":/srv/pillar/ \
    -v "$CUR_DIR/salt":/srv/salt/ \
    test-formula \
    $*
