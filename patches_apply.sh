#!/bin/bash

THISDIR=$PWD

cd ..
TOPDIR=$PWD

cd build
echo "Patching $PWD (user/host metadata)"
patch -p1 < $THISDIR/patch_001_build.patch
cd $TOPDIR

cd system/bt
echo "Patching $PWD (addl. CVE)"
patch -p1 < $THISDIR/patch_004_system_bt.patch
cd $TOPDIR

cd $THISDIR





