#!/bin/bash
# -*- coding: utf-8 -*-
# Simple script for ping sweep in a network
# Still working in adding easy and direct support for bigger networks
# Made by sp1d3rm0rph3us

### FUNCTIONS ###
# COLORS #

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m'

print_red() {
    echo -e "${RED}$1${NC}"
}

print_green() {
    echo -e "${GREEN}$1${NC}"
}

print_blue(){
    echo -e "${BLUE}$1${NC}"
}
print_yellow(){
    echo -e "${YELLOW}$1${NC}"
}


### MAIN CONDITION ###

if [ "$1" == "" ]; then
    echo "Usage: $0 172.15.0"

else
    print_yellow "╔════════════════════════════════════════════════╗"
    print_yellow "║           SWEEPTHEM by sp1d3rm0rph3us          ║"
    print_yellow "╚════════════════════════════════════════════════╝"
    print_yellow ""
    print_red "- Obliterating your privacy, as usual."
    for host in {1..254}; do
        if  ping -c 1 $1.$host | grep "64 bytes" > /dev/null 2>&1 ; then
            print_green "[+] Found $1.$host"
        fi
    done
fi
