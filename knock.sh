#!/bin/bash
# -*- coding: utf-8 -*-

# Simple port and network scanner using bash scripting
# Made by sp1d3rm0rph3us

if [[ "$1" == "" || "$2" == "" ]]
    then
        echo "KNOCK KNOCK, ARE YOU THERE?"
        echo "Usage: $0 target-ip port"
        echo "Ex: $0 192.168.0"

else
    for x in {1..254}; do
        hping3 -S -p $2 -c 1 $1.$x 2>/dev/null | grep "flag=SA" | cut -d " " -f2;
    done
fi
