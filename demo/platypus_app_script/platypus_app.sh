#!/bin/sh

if [ "$#" -eq 0 ]; then
    echo "Hello world"
    echo "What's up?"
    echo "Hey-ho, let's go!"
else
    /usr/bin/say "$*"
fi
