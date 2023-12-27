#!/bin/bash
# -*- coding: utf-8 -*-
# Simple script for discovering IPs in a network
# Still working in adding easy and direct support for bigger networks
# Script by: sp1d3rm0rph3us

if [ "$1" == "" ]
then
    echo "Usage: $0 172.15.0"

else
    for host in {1..254}
    do
        ping -c 1 $1.$host | grep "64 bytes" | cut -d ":" -f1 | cut -d " " -f4;
    done
fi
     
