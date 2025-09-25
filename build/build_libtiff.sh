#!/bin/bash
set -e

cd /root

if [ ! -f tmp-libtiff.tar.gz ]; then
  curl http://download.osgeo.org/libtiff/tiff-4.7.0.tar.gz -L -o tmp-libtiff.tar.gz
  tar xf tmp-libtiff.tar.gz
fi

cd tiff*

PKG_CONFIG_PATH=/root/build/cache/lib/pkgconfig \
  ./configure \
    CPPFLAGS=-I/root/build/cache/include \
    LDFLAGS=-L/root/build/cache/lib \
    --disable-dependency-tracking \
    --disable-shared \
    --enable-static \
    --prefix=/root/build/cache

make
make install
