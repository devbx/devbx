#!/bin/bash
rm -rf .repo/local_manifests/
repo init -u https://github.com/ProjectMatrixx/android.git -b 14.0 --git-lfs
git clone https://github.com/devbx/local_manifests.git -b matrixx .repo/local_manifests
/opt/crave/resync.sh
export BUILD_USERNAME=devbx
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export KBUILD_USERNAME=devbx
export KBUILD_HOSTNAME=crave
export TZ=Asia/Kuching
git clone https://github.com/devbx/keys
mkdir vendor/lineage-priv/
mv keys vendor/lineage-priv
source build/envsetup.sh
breakfast earth
make installclean
brunch earth
