echo "Hi, This Script will build AOSP for Nexus 5X"
echo "Starting"
echo "cleaning"
make clean && make clobber
echo "Cleaned Working Directory"
echo "Starting Build"
lunch aosp_bullhead-userdebug
echo "Lunch Complete"
echo "Making Flashable Zip via make otapackage"
make otapackage
