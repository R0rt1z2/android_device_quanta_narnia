#!bin/bash

PATCHES_DIR="device/quanta/narnia/patches" # Change this with your device path!

echo "Applying patches..."

cd system/core/init

git apply -v ../../$PATCHES_DIR/system/core/init/0001-MEDIATEK-MT8127-INIT.patch

cd ../..

echo "Patching complete!"

