#!/bin/bash

#
echo ""
echo "2019-Present A-Team Digital Solutions"
#

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
echo "-       Installer Version: 0.13          -"
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
echo ""
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
echo ""
echo "======== Encryption Selection ======="
echo "-------------------------------------"
echo "1 => Keep Encryption                -"
echo "2 => Disable Encryption             -"
echo "-------------------------------------"
echo "Select Your Option & PRESS ENTER    -"
echo "-------------------------------------"
read crypto

# Option 1 - Keep Encryption
if [[ $crypto == 1 ]]
then
clear
echo ""
echo "Encryption => Enabled"
echo ""  
echo "" 
sleep 7

# Option 2 - Disable Encryption
elif [[ $crypto == 2 ]]
then
clear
echo "" 
echo "Encryption => Disabled"
echo ""  
echo "" 
CRYPTO=FALSE
sleep 7
fi
############################

# Flash Boot
echo "Flashing Boot..."
echo ""
fastboot flash boot Magisk.img
echo ""
echo ""

# Flash Dtbo
echo "Flashing Dtbo..."
echo ""
fastboot flash dtbo dtbo.img
echo ""
echo "" 

# Flash Recovery
echo "Flashing Recovery..."
echo ""
fastboot flash recovery recovery.img
echo ""
echo "" 

# Flash Vbmeta
echo "Flashing Vbmeta..."
echo ""
fastboot flash --disable-verity --disable-verification vbmeta vbmeta.img
echo ""
echo ""  

# Format Data & Metadata
echo "Formatting Data & Metadata..."
sleep 7
echo ""
fastboot -w
echo ""
echo ""

# Reboot Device
fastboot reboot fastboot
echo ""
echo ""

# Delete Logical Super Partitions
echo "Deleting Logical Super Partitions..."
echo ""
fastboot delete-logical-partition product_a
fastboot delete-logical-partition system_a
fastboot delete-logical-partition vendor_a
fastboot delete-logical-partition product_b
fastboot delete-logical-partition system_b
fastboot delete-logical-partition vendor_b
echo ""
echo ""

# Create New Logical Super Partitions
echo "Creating New Logical Super Partitions..."
echo ""
fastboot create-logical-partition product_a 2300314624
fastboot create-logical-partition system_a 2300314624
fastboot create-logical-partition vendor_a 975491072
echo ""
echo ""

# Flash Product
echo "Flashing Product..."
echo ""
fastboot flash product_a product.img
echo ""
echo ""

# Flash System
echo "Flashing System..."
echo ""
fastboot flash system_a system.img
echo ""
echo ""

# Auto Flash Encryption Choice
if [[ $CRYPTO == FALSE ]]
then
echo "Flashing Encryption Patched Vendor..."
echo ""
fastboot flash vendor_a NoEncrypt-vendor.img
echo ""
echo ""
else
echo "Flashing Encryption UnPatched Vendor..."
echo ""
fastboot flash vendor_a vendor.img
echo ""
echo ""
fi

# Reboot Device
fastboot reboot
echo ""
echo ""

sleep 3

echo ""
echo ""
echo "=== THANK YOU ===== PLEASE ENJOY ==="
echo "------------------------------------"
echo "======= PRESS ENTER TO EXIT ========"
read
