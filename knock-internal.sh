#!/bin/bash
# -*- coding: utf-8 -*-

### KNOCK-KNOCK, ARE YOU THERE? ###

# Simple port knocking script for internal network scenarios
# Originally intended to find one specific host that will respond
# Made by sp1d3rm0rph3us
# Based on DESEC Security Network & Port scanner from Pentest Profissional course.
# Create a file with possible ips in the network and use it as the first argument
# Then create another file with ports for port knocking and use it as the second argument

## FUNCTIONS ##
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

# Function for loading screens #
animate_dots() {
    local i
    for i in {1..4}; do
        echo -ne "..${i//?/.}" && sleep 0.2
        echo -ne "\r\033[K" && sleep 0.2
    done
    echo ""     # Empty line 
}

# Function to set text formatting and color in banner #
style_text() {
    echo -e "\e[$1m$2\e[0m"
}

# Function to display animated banner
animate_banner() {
    text="KNOCK-KNOCK, ARE YOU THERE?"
    length=${#text}

    for ((i=1; i<=length; i++)); do
        clear
        spaces=$((i-1))
        formatted_text=$(style_text "1;36" "$(printf '%*s' $spaces | tr ' ' '-')$(style_text "1;35" "${text:0:$i}")")
        echo -e "$formatted_text"
        sleep 0.05
    done

    sleep 0.2

    for ((i=length-1; i>=0; i--)); do
        clear
        spaces=$((i-1))
        formatted_text=$(style_text "1;36" "$(printf '%*s' $spaces | tr ' ' '-')$(style_text "1;35" "${text:0:$i}")")
        echo -e "$formatted_text"
        sleep 0.1
    done
}

### PORT KNOCKING CONDITIONS ###

animate_banner
echo ""

# Checking if arguments were given

if [[ "$1" == "" || "$2" == "" ]]; then
    echo "KNOCK KNOCK, ARE YOU THERE?"
    echo "Usage: $0 target-NETWORK port1 port2..."
    echo "Ex: $0 [hostlist] port..."

else
    portlist=$(cat $2)
    hostlist=$(cat $1)
    for hosts in $hostlist; do
        for port in $portlist; do
            echo "[*] Knocking on port: $port"
            animate_dots
            if hping3 -S -p $port -c 1 $hosts | grep "flags=SA" ; then
                correct_port=$port
                correct_host=$hosts
                print_blue "[+] $correct_host responding on port $correct_port"

            else
                print_red "[!] $hosts is not responding on port $port" 
            fi
            done
        done
    if hping3 -S -p $port -c 1 $correct_host | grep "flags=SA" ; then
        echo ""
        print_green "[+] Port knocking successful on host $correct_host! Port $correct_port is responding."
    else
        print_red "[!] Port knocking failled. Port 1337 is not responding."
    fi
fi
