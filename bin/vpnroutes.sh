#!/bin/sh
# TODO: figure out how to make this more portable, e.g. for wireguard
# or openvpn or something

# macos
gw=`netstat -rn -f inet |grep utun | head -1 | awk '{print $2}'`

while [ $# -gt 0 ]
do
    sudo route add $1 $gw
    shift
done

