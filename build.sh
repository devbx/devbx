#!/bin/bash
rm -rf .repo/local_manifests/
repo init -u https://github.com/Evolution-XYZ/manifest.git -b udc --git-lfs
git clone https://github.com/devbx/local_manifests --depth 1 -b evo-u .repo/local_manifests
export BUILD_USERNAME=devbx
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export TZ=Asia/Kuching
source build/envsetup.sh
lunch lineage_earth-userdebug
m evolution
crave pull out/target/product/*/*.img
crave pull out/target/product/*/*.zip
