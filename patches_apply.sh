#!/bin/bash

THISDIR=$PWD

cd ..
TOPDIR=$PWD

cd build
echo "Patching $PWD (user/host metadata)"
patch -p1 < $THISDIR/patch_001_build.patch
cd $TOPDIR

cd device/qcom/sepolicy
echo "Patching $PWD (QCOM sepolicy)"
patch -p1 < $THISDIR/patch_002_device-qcom-sepolicy.patch
cd $TOPDIR

cd packages/apps/Email
echo "Patching $PWD (E-Mail Widget)"
patch -p1 < $THISDIR/patch_010_Email.patch
cd $TOPDIR

cd $THISDIR





