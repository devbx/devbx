#!/bin/bash
rm -rf .repo/local_manifests/
repo init -u https://github.com/DroidX-UI/manifest.git -b 14_v3 --git-lfs
git clone https://github.com/devbx/local_manifests.git -b dxui .repo/local_manifests
/opt/crave/resync.sh
export BUILD_USERNAME=devbx
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export KBUILD_USERNAME=devbx
export KBUILD_HOSTNAME=crave
export TZ=Asia/Kuching
source build/envsetup.sh
lunch droidx_earth-ap2a-userdebug
make installclean
m bacon
