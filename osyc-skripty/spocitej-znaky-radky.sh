#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

FILE=$1

if [ ! -f "$FILE" ]; then
    echo "File not found!"
    exit 1
fi

WORDS=$(wc -w < "$FILE")
LINES=$(wc -l < "$FILE")
CHARS=$(wc -m < "$FILE")

echo "Words: $WORDS"
echo "Lines: $LINES"
echo "Characters: $CHARS"
