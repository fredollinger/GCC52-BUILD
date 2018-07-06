#!/bin/bash

# die if anything goes wrong
set -e 

mkdir build 
cd build 
wget http://ftpmirror.gnu.org/gcc/gcc-5.2.0/gcc-5.2.0.tar.bz2 
wget https://gmplib.org/download/gmp/gmp-6.0.0a.tar.xz 
wget ftp://ftp.gnu.org/gnu/mpc/mpc-1.0.3.tar.gz 
wget https://www.mpfr.org/mpfr-3.1.5/mpfr-3.1.5.tar.xz
wget ftp://gcc.gnu.org/pub/gcc/infrastructure/isl-0.14.tar.bz2
tar xf gcc-5.2.0.tar.bz2 
tar xf gmp-6.0.0a.tar.xz 
mv gmp-6.0.0 gcc-5.2.0/gmp 
tar xf mpc-1.0.3.tar.gz 
mv mpc-1.0.3 gcc-5.2.0/mpc 
tar xf mpfr-3.1.5.tar.xz 
mv mpfr-3.1.5 gcc-5.2.0/mpfr 
tar xf isl-0.14.tar.bz2 
mv isl-0.14 gcc-5.2.0/isl
mkdir -p gcc-5.2.0/gcc-build 
cd gcc-5.2.0/gcc-build 
../configure --prefix=/usr/local/x86_64-local-gcc-5.2.1 \
         --disable-multilib \
         --enable-languages=c,c++ \
         --enable-libstdcxx-threads \
         --enable-libstdcxx-time \
         --enable-shared \
         --enable-__cxa_atexit \
         --disable-libunwind-exceptions \
         --disable-libada \
         --with-default-libstdcxx-abi=gcc4-compatible 
make -j13
sudo make install 
