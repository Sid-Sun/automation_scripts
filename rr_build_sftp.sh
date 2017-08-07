#!/bin/sh

#Automation variables for RR
if [ ! -z "$1" ] || [ ! -z "$2" ] || [ ! -z "$3" ] || [ ! -z "$4" ]
then
    export days_to_log=$4
    export WITH_ROOT_METHOD=$3
    export RR_BUILDTYPE=$2
    export device=$1
else
    echo "usage: $0 <Device Codename> <Build Type> <Root Method> <Change Log Days>"
    #and for pro users : [USE_CCACHE] [OUT_DIR_COMMON_BASE] [KBUILD_BUILD_HOST] [KBUILD_BUILD_USER] [-j? (only number)]
    echo "\t<Device Codename> = Enter Your Device Codename"
    echo "\t<Build Type> = Which build-type do you want to choose? (Official, Unofficial, Nightly, Weekly, Release, Milestone, Experimental, Final)"
    echo "\t<Root Method> = Which root method do you want to use? (0- Magisk, 1 or any other input- Rootless)"
    echo "\t<Change Log Days> = For how many days changelog do you want to generate?"
    #echo "\t[USE_CCACHE] = Use Ccache? (0- disable, any other input- Size)"
    #echo "\t[OUT_DIR_COMMON_BASE] = Custom Output Directory?"
    #echo "\t[KBUILD_BUILD_HOST] = Custom KBUILD HOST?"
    #echo "\t[KBUILD_BUILD_USER] = Custom KBUILD USER?"
exit
fi

#CCACHE
if [ ! -z "$5" ]
then
    if [[ "$5" == "0" ]]
    then
        export USE_CCACHE=0
    else
        export USE_CCACHE=1
        export CCACHE_DIR=/path/to/ccache
        prebuilts/misc/linux-x86/ccache/ccache -M $5
    fi
else
    export USE_CCACHE=1
    export CCACHE_DIR=/path/to/ccache
    prebuilts/misc/linux-x86/ccache/ccache -M 70G
fi

#Custom Output Directory
if [ ! -z "$6" ]
then
    export OUT_DIR_COMMON_BASE=$6
else
    export OUT_DIR_COMMON_BASE=/path/to/custom/out/directory
fi

#Custom KBUILD HOST
if [ ! -z "$7" ]
then
    export KBUILD_BUILD_HOST=$7
else
    export KBUILD_BUILD_HOST=BuildHost
fi

# USER
if [ ! -z "$8" ]
then
    export KBUILD_BUILD_USER=$8
else
    export KBUILD_BUILD_USER=BuildUser
fi

# J
if [ ! -z "$9" ]
then
    J=$9
else
    J=16
fi

#Repo Sync
repo sync -c -f -j$J --current-branch --no-tags --no-tag --no-clone-bundle --optimized-fetch --force-broken --force-sync

#Clean - only Enable If You Want
#make clean && make clobber

#Build
. build/envsetup.sh
#lunch lineage_$device-userdebug
brunch $device
#make otapackage -j$J
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
