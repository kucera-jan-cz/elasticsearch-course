#!/bin/bash

CLONE=${1:-elasticsearch-02}
NAME=elasticsearch
# Elasticsearch log directory
LOG_DIR=/var/log/$NAME

# Elasticsearch data directory
DATA_DIR=/var/lib/$NAME

# Elasticsearch configuration directory
CONF_DIR=/etc/$NAME

cd $LOG_DIR/..
cp -n -r $NAME $CLONE
chown -R elasticsearch:elasticsearch $CLONE

cd $DATA_DIR/..
mkdir $CLONE
chown -R elasticsearch:elasticsearch $CLONE

cd $CONF_DIR/..
cp -n -r $NAME $CLONE
chown -R elasticsearch:elasticsearch $CLONE
