#!/bin/bash

if [ ! -d "$1" ]; then
    echo "Please pass in a valid directory";
    exit 1
fi

if [ -d "$1/relics" ]; then
    ./build-relics.sh "$1/relics"
fi
