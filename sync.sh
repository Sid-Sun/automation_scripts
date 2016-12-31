echo "Hi! This Script will Sync AOSP Source Code in current directory"
echo "Initializing For Syncing  AOSP Source Code"
repo init -u https://android.googlesource.com/platform/manifest.git -b android-7.1.1_r6
echo "Repo init Succesful"
echo "Begining Sync"
repo sync -c -f --force-sync --force-broken --no-tags --no-tag
echo "Repo Sync Succesful"
echo "Begining Device Tree Kernel, Vendor, TWRP, Busybox Sync"
echo "Cloning Device Tree"
git clone -b nougat-7.1.1 https://github.com/Sid-Sun/aosp_device_lge_bullhead.git device/lge/bullhead
echo "Device Tree cloned Succesfully"
echo "Cloning Kernel"
git clone -b android-7.1.1_r6 https://android.googlesource.com/device/lge/bullhead-kernel.git device/lge/bullhead-kernel
echo "Kernel cloned Succesfully"
echo "Cloning LGE Vendor"
git clone -b nougat-7.1.1 https://github.com/Sid-Sun/aosp_vendor_lge.git vendor/lge
echo "Cloning TWRP to replace with Stock Recovery"
rm -rf bootable/recovery
git clone -b android-7.1 https://github.com/omnirom/android_bootable_recovery.git bootable/recovery
echo "TWRP Succesfully Cloned"
echo "Cloning BusyBox"
git clone -b android-7.0 https://github.com/omnirom/android_external_busybox.git external/busybox
echo "Source Code Synced and prepared for Building"
echo "If you Want to build, Run the build.sh"
