#!/bin/bash
rm -rf .repo/local_manifests/
repo init -u https://git.libremobileos.com/LMODroid/manifest.git -b fourteen --git-lfs
git clone https://github.com/devbx/local_manifests.git -b lmod .repo/local_manifests
/opt/crave/resync.sh
export BUILD_USERNAME=devbx
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export KBUILD_USERNAME=devbx
export TZ=Asia/Kuching
source build/envsetup.sh
breakfast earth
make installclean
brunch earth
