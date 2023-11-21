#!/bin/bash

#
# Copyright 2019-Present A-Team Digital Solutions
#

# Generic Ass Menu
echo "A-Team Magisk Boot Image Patcher"
echo ""
echo "Magisk Version: 26.4"
echo "A-Team Version: 0.04"
echo ""
echo ""
echo ""
sleep 7

# CD Into A-Team Folder
cd A-Team

sh boot_patch.sh ../../boot.img

# Cleanup
rm -rf ramdisk.cpio
rm -rf kernel_dtb

# Move Patched Boot Image
mv new-boot.img ../../Magisk.img

echo ""
echo ""
echo ""
echo "Boot Image Should Now Be Magisk Patched"
echo ""
echo ""
sleep 7

