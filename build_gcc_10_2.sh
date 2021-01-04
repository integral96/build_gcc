#! /bin/bash

GCC_VERSION="10.2.0"
WORKDIR="$HOME/src/"
INSTALLDIR="/usr/bin"

cd $WORKDIR
wget http://mirror.linux-ia64.org/gnu/gcc/releases/gcc-10.2.0/gcc-10.2.0.tar.gz
tar -xf gcc-10.2.0.tar.gz

cd gcc-10.2.0
./contrib/download_prerequisites

cd ..
mkdir gcc-build
cd gcc-build

# build
../gcc-${GCC_VERSION}/configure                      \
    --prefix=${INSTALLDIR}                           \
    --enable-shared                                  \
    --enable-threads=posix                           \
    --enable-__cxa_atexit                            \
    --enable-clocale=gnu                             \
    --enable-languages=all                           \
&& make -j$(nproc) \
&& make install
