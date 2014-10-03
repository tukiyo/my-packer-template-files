#!/bin/bash

# Clean up
#apt-get -y --purge remove linux-headers-$(uname -r) build-essential
apt-get -y --purge autoremove
mv /etc/apt/sources.list /etc/apt/sources.list~
apt-get clean
mv /etc/apt/sources.list~ /etc/apt/sources.list

# sync data to disk (fix packer)
sync
