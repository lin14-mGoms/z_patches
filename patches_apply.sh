#!/bin/bash

THISDIR=$PWD

cd ..
TOPDIR=$PWD

cd build
echo "Patching $PWD (user/host metadata)"
patch -p1 < $THISDIR/patch_001_build.patch
cd $TOPDIR

cd vendor/cm
echo "Patching $PWD (signed builds)"
patch -p1 < $THISDIR/patch_002_vendor_cm.patch
cd $TOPDIR

cd $THISDIR





