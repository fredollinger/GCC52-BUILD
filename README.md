# GCC52-BUILD
A script to build gcc-5.2 from scratch.

## What This Does

This will try to build gcc-5.2 from scratch and install it in /usr/local/x86_64-local-gcc-5.2.1.

You could then use the executables found in /usr/local/x86_64-local-gcc-5.2.1/bin such as gcc.

## What You Need

A fairly recent Linux distribution.

Not sure which compiler is needed.

You could use your distro to install the needed toolchair or get a pre-built compiler.

## Use Linux Distro Packages

Debian users can try to run:

```
apt-get build-dep gcc
```

However, this did not work for me. It kinda creates a check and egg problem
because if your distro has the compiler you needed, why are you doing this?

## Pre-built Compiler

I actually used a pre-built compiler found here:

```
https://github.com/Zenfone2-Dev/x86_64-linaro-gcc-5.2.1.git
```

Follow the directions to install it.

I had an issue with the pre-built compiler when I used it for what I wanted it
for which was a Yocto build. This is why I decided to roll my own compiler.

However, it was good enough to build gcc-5.

## How to Use This

Read the build.sh script to make sure it does what you'd like it to do.

sh build.sh

You'll need to type in your root password at the end as we use sudo to install.

## Using


Once things are installed, you can use the tool-chain in different ways.

### Call Directly 

You can run the compiler directly by /usr/local/x86_64-local-gcc-5.2.1/bin/gcc
for example.

### Symlinks

I like this method. But you have to be aware that if your distro installs gcc
or g++ it will overwrite your local compiler, and you'll have to restore
symlinks.

```
mv /usr/bin/gcc /usr/bin/g++ /tmp
ln -s /usr/local/x86_64-local-gcc-5.2.1/bin/gcc /usr/bin/gcc
ln -s /usr/local/x86_64-local-gcc-5.2.1/bin/g++ /usr/bin/g++
```

### Environmental Variables

```
export CC=/usr/local/x86_64-local-gcc-5.2.1/bin/gcc
export CXX=/usr/local/x86_64-local-gcc-5.2.1/bin/g++
export CPP=/usr/local/x86_64-local-gcc-5.2.1/bin/g++
```



