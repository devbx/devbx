#!/bin/bash
rm -rf .repo/
repo init -u https://github.com/OrionOS-prjkt/android -b 14.0 --git-lfs
git clone https://github.com/devbx/local_manifests.git -b orion .repo/local_manifests
/opt/crave/resync.sh
export BUILD_USERNAME=devbx
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export KBUILD_USERNAME=devbx
export KBUILD_HOSTNAME=crave
export TZ=Asia/Kuching
source build/envsetup.sh
lunch orion_earth-ap2a-userdebug
make installclean
mka space
