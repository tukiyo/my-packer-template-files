#!/bin/sh
DATETIME=2015.07.01
FILENAME=archlinux-${DATETIME}-dual.iso
wget -O $FILENAME \
  "http://ftp.tsukuba.wide.ad.jp/Linux/archlinux/iso/${DATETIME}/$FILENAME"
