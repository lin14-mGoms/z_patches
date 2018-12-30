#!/bin/bash

# Check parameters
case "$1" in
  test) TESTKEY=true
    ;;
  sign) TESTKEY=false
    ;;
  *) echo "usage: build_gts210ltexx test|sign"
     echo "----------------------------------"
     echo "test - build with testkeys (insecure, but compatible)"
     echo "sign - create a signed build"
     exit
    ;;   
esac

# Initiate environment
source build/envsetup.sh

# CCache
# ------
# uncomment the below line to set own cache 
# directory (default is ~/.ccache)
export USE_CCACHE=1
#export CCACHE_DIR=~/android/.ccache
prebuilts/misc/linux-x86/ccache/ccache -M 40G

# build with root baked in
export WITH_SU=true

# Normalize build metadata
export KBUILD_BUILD_USER=android
export KBUILD_BUILD_HOST=localhost

if [ "$TESTKEY" = false ] ; then
  export OWN_KEYS_DIR=~/.android-certs
  export RELEASE_TYPE=UNOFFICIAL-microG-signed

  # We need symlinks to fake the existence of a testkey 
  # for the selinux build process and cyngn-priv-app for
  # some old CM apps
  for c in cyngn{-priv,}-app testkey; do
    for e in pk8 x509.pem; do
      ln -s releasekey.$e "$OWN_KEYS_DIR/$c.$e" 2> /dev/null
    done
  done
else
  export RELEASE_TYPE=UNOFFICIAL-microG
fi

# start build
brunch gts210ltexx

