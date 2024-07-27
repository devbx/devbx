#!/bin/bash
rm -rf .repo/local_manifests/
repo init --depth=1 -u https://github.com/ProjectBlaze/manifest -b 14
git clone https://github.com/devbx/local_manifests.git -b blaze .repo/local_manifests
/opt/crave/resync.sh
export BUILD_USERNAME=devbx
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export KBUILD_USERNAME=devbx
export KBUILD_HOSTNAME=crave
export TZ=Asia/Kuching
source build/envsetup.sh
lunch blaze_earth-ap2a-userdebug
make installclean
make bacon
