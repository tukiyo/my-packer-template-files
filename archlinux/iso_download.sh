#!/bin/sh
DATETIME=2014.09.03
FILENAME=archlinux-${DATETIME}-dual.iso
wget -O $FILENAME \
  "http://ftp.tsukuba.wide.ad.jp/Linux/archlinux/iso/${DATETIME}/$FILENAME"
