#!/bin/bash
​
# Update and Install apps on Xenial and Bionic ubuntu servers
if [ "$(lsb_release -cs)" = "xenial" -o "$(lsb_release -cs)" = "bionic" ]; then
    apt-get update -y
fi