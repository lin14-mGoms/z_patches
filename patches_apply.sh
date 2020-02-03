#!/bin/bash

THISDIR=$PWD

cd ..
TOPDIR=$PWD

cd build
echo "Patching $PWD (user/host metadata)"
patch -p1 < $THISDIR/patch_001_build.patch
cd $TOPDIR

cd external/p7zip
echo "Patching $PWD (p7zip hugefile support)"
patch -p1 < $THISDIR/patch_004_p7zip.patch
cd $TOPDIR

cd $THISDIR





