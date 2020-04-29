#!/bin/bash

# CCache
export USE_CCACHE=1
#export CCACHE_DIR=~/.ccache14
prebuilts/misc/linux-x86/ccache/ccache -M 40G

# Initiate env
source build/envsetup.sh

# OMS default build
export RELEASE_TYPE=UNOFFICIAL-oms

# un-comment below line, if you want to build with root baked in
# export WITH_SU=true

# Normalize build metadata
export KBUILD_BUILD_USER=android
export KBUILD_BUILD_HOST=localhost

# Execute Brunch
brunch osprey


