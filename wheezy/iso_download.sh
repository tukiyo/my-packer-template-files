#!/bin/sh
VERSION=7.6.0
FILENAME=wheezy-amd64-netinst.iso
wget -O $FILENAME \
  http://ftp.riken.jp/Linux/debian/debian-cdimage/release/current/amd64/iso-cd/debian-${VERSION}-amd64-netinst.iso
