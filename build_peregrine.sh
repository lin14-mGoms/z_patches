#!/bin/bash

# CCache
export USE_CCACHE=1
#export CCACHE_DIR=~/android/.ccache
prebuilts/misc/linux-x86/ccache/ccache -M 40G

# Initiate env
source build/envsetup.sh

# OMS default build
export RELEASE_TYPE=UNOFFICIAL-oms

# Anonymize Kernel build
export KBUILD_BUILD_USER=android
export KBUILD_BUILD_HOST=localhost

# Execute Brunch
brunch peregrine


