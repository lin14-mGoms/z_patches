#!/bin/bash

# CCache
export USE_CCACHE=1
#export CCACHE_DIR=~/.ccache14
prebuilts/misc/linux-x86/ccache/ccache -M 32G

# with root
export WITH_SU=true

# Initiate env
source build/envsetup.sh

# Anonymize Kernel build
export KBUILD_BUILD_USER=android
export KBUILD_BUILD_HOST=localhost

# Execute Brunch
brunch falcon


