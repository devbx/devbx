#!/bin/bash
rm -rf .repo/local_manifests/
repo init --depth=1 -u https://github.com/ProjectSakura/android.git -b 14 --git-lfs
git clone https://github.com/devbx/local_manifests.git -b sakura-gapps .repo/local_manifests
/opt/crave/resync.sh
export BUILD_USERNAME=devbx
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export KBUILD_USERNAME=devbx
export KBUILD_HOSTNAME=crave
export TZ=Asia/Kuching
source build/envsetup.sh
lunch lineage_earth-ap2a-userdebug
make installclean
mka bacon
