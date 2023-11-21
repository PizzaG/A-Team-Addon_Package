#!/bin/bash

#
echo "2019-Present A-Team Digital Solutions"
#

cd A-Team

# Main Menu
echo "=========================================="
echo "------------------------------------------"
echo "-                                        -"
echo "-                A-Team                  -"
echo "-           Digital Solutions            -"
echo "-                                        -"
echo "-          PROUDLY PRESENTS....          -"
echo "-                                        -"
echo "------------------------------------------"
echo "========== A-Team Rom Flasher ============"
echo "------------------------------------------"
echo "-                                        -"
echo "-           Built By: PizzaG             -"
echo "-       Installer Version: 0.09          -"
echo "-                                        -"
echo "------------------------------------------"
echo "-                                        -"
echo "* Put Device In Fastboot/Bootloader Mode *"
echo "-                                        -"
echo "------------------------------------------"
echo "=========================================="
echo ""
echo ""
echo "PRESS ENTER TO CONTINUE"
read

clear

# Set Slot
fastboot set_active a

clear

# Active Slot
echo "========= Your Current Slot ========"
echo ""
echo ""
echo "------------------------------------"
fastboot getvar current-slot
echo "------------------------------------"
echo ""
echo ""
echo "PRESS ENTER TO CONTINUE"
read

clear

# Encryption Menu
echo "======== Encryption Selection ======="
echo "-------------------------------------"
echo "1 => Keep Encryption                -"
echo "2 => Disable Encryption             -"
echo "-------------------------------------"
echo "Select Your Option & PRESS ENTER    -"
echo "-------------------------------------"
read encryption

# Option 1 - Keep Encryption
if [[ $encryption == 1 ]]
then
clear
echo "Encryption => Enabled"
sleep 7
echo "" 
echo ""  
echo "Flashing Rom..."
sleep 3
echo "" 
echo ""  
fastboot flash boot Magisk.img
echo ""
echo "" 
fastboot flash dtbo dtbo.img
echo ""
echo "" 
fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img
echo ""
echo "" 
fastboot --disable-verity --disable-verification flash vbmeta_system vbmeta_system.img
echo ""
echo "" 
fastboot flash vendor_boot vendor_boot.img
echo ""
echo "" 
fastboot flash super super.img

sleep 7

clear

# Format Data & Metadata
echo "Formatting Data & Metadata..."
sleep 7
echo ""
echo ""
fastboot -w

sleep 7

clear

# Option 2 - Disable Encryption
elif [[ $encryption == 2 ]]
then
clear
echo "Encryption => Disabled"
sleep 7
echo "" 
echo ""  
echo "Flashing Rom..."
sleep 3
echo "" 
echo ""  
fastboot flash boot Magisk.img
echo ""
echo "" 
fastboot flash dtbo dtbo.img
echo ""
echo "" 
fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img
echo ""
echo "" 
fastboot --disable-verity --disable-verification flash vbmeta_system vbmeta_system.img
echo ""
echo "" 
fastboot flash vendor_boot vendor_boot.img
echo ""
echo "" 
fastboot flash super super.img

sleep 7

clear

# Format Data & Metadata
echo "Formatting Data & Metadata..."
sleep 7
echo ""
echo ""
fastboot -w

sleep 7

clear

# Reboot To FastbootD
fastboot reboot fastboot

sleep 7

clear

# Flash Encryption Patched Vendor
echo "Flashing Un-Encrypted Patched Vendor..."
sleep 7
echo ""
echo ""
fastboot flash vendor_a NoEncrypt-vendor.img

sleep 7

clear

fi
############################

fastboot reboot

sleep 3

clear

echo "=== THANK YOU ===== PLEASE ENJOY ==="
echo "------------------------------------"
echo "======= PRESS ENTER TO EXIT ========"
read
