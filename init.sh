#!/usr/bin/env bash

TMP_SETUP_DIR="tmp/docker-setup"
CURRENT_PWD=$PWD
CLEANUP=false

if [ ! -d $TMP_SETUP_DIR ]
  then
    mkdir -p $TMP_SETUP_DIR
    CLEANUP=true
fi

cd $TMP_SETUP_DIR

git clone --depth 1 git@github.com:micron/docker-setup.git .

rsync -rv --dry-run --ignore-existing --exclude='./init.sh' --exclude='.git' . $CURRENT_PWD/

if [ "$CLEANUP" = true ]
  then
    cd $CURRENT_PWD
    rm -rf $TMP_SETUP_DIR
fi