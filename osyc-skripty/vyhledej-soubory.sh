#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 directory text"
    exit 1
fi

DIRECTORY=$1
TEXT=$2

if [ ! -d "$DIRECTORY" ]; then
    echo "Directory not found!"
    exit 1
fi

grep -rl "$TEXT" "$DIRECTORY"
