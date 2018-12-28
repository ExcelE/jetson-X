#!/bin/bash

set -e

check_id=`lsb_release -r -s`

if [ "${check_id}"="18.04" ]; then
    echo "You are using 18.04... OK"
else
    echo "${check_id} is not supported for this script. Must be 18.04"
    exit 1
fi


{
    echo "Installing the required packages..."

    # install based on here: https://devtalk.nvidia.com/default/topic/1033194/jetson-tx2/installing-jetpack-3-2-on-ubuntu-18-04/
    sudo wget -q -O /tmp/libpng12.deb http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb \
    && sudo dpkg -i /tmp/libpng12.deb \
    && sudo rm /tmp/libpng12.deb

    # install xterm 
    sudo apt-get update
    sudo apt-get install xterm -y

    clear
    echo "Step 0 is done. You can now install Jetpack 3.3."
    echo
    echo
} || {
    clear
    echo "Something failed. Do this step manually."
    echo
    echo
}