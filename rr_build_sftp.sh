#!/bin/bash

#CCACHE
export USE_CCACHE=1
export CCACHE_DIR=/path/to/ccache
prebuilts/misc/linux-x86/ccache/ccache -M 70G

#Custom Output Directory
export OUT_DIR_COMMON_BASE=/path/to/custom/out/directory

#Custom KBUILD HOST & USER
export KBUILD_BUILD_HOST=BuildHost
export KBUILD_BUILD_USER=BuildUser

#Repo Sync
repo sync -c -f -j16 --current-branch --no-tags --no-tag --no-clone-bundle --optimized-fetch --force-broken --force-sync

#Clean
make clean && make clobber

#Automation variables for RR
export days_to_log=3
export WITH_ROOT_METHOD=magisk

#Build
source build/envsetup.sh
lunch lineage_$device-userdebug
#brunch $device -j16
#make otapackage -j16
#OR Whatever command suits your boat!

#Upload Config for SFTP
UHOST=sftp.host.address
UDIR=path/where/file/has/to/be/put
UCD=$(OUT_DIR_COMMON_BASE)/target/product/*
UPUT="*$(device)*zip"
#Let us upload
cd $UCD
sftp -i /path/to/private/key -b /path/to/batchfile.txt $UUSER@$UHOST <<EOF
cd $UDIR
put $UPUT
bye
EOF