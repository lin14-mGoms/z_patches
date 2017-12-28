#!/bin/bash

THISDIR=$PWD

cd ..
TOPDIR=$PWD

cd build
echo "Patching $PWD (user/host metadata)"
patch -p1 < $THISDIR/patch_001_build.patch
cd $TOPDIR

cd frameworks/base
echo "Patching $PWD (microG Patch)"
patch -p1 < $THISDIR/patch_003_microG_001-N.patch
patch -p1 < $THISDIR/patch_003_microG_002-N.patch
cd core/res/res/values
rm *orig
cd $TOPDIR

cd $THISDIR





