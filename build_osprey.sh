#!/bin/bash

# CCache
export USE_CCACHE=1
#export CCACHE_DIR=~/.ccache14
prebuilts/misc/linux-x86/ccache/ccache -M 32G

# Adjust TOOLCHAIN path 
export KERNEL_TOOLCHAIN=~/android/build-tools-gcc/arm-linux-gnueabi/bin
export KERNEL_TOOLCHAIN_PREFIX=arm-linux-gnueabi-

# with root
export WITH_SU=true

# Initiate env
source build/envsetup.sh

# Anonymize Kernel build
export KBUILD_BUILD_USER=android
export KBUILD_BUILD_HOST=localhost

# Execute Brunch
brunch osprey


