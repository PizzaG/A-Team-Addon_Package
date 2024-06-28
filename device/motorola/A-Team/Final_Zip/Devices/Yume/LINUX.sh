#!/bin/bash

INSTALLER_VERSION="0.15"

APP_NAME="A-Team Custom Rom Installer - Version: $INSTALLER_VERSION" 

# Print App Name To Terminal
echo -ne "\033]0;$APP_NAME\007"

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
echo "-       Installer Version: 0.15          -"
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

# Recovery Menu
echo ""
echo "========= Recovery Selection ========"
echo "-------------------------------------"
echo "1 => OrangeFox                      -"
echo "2 => PitchBlack                     -"
echo "3 => SkyHawk                        -"
echo "4 => TWRP                           -"
echo "5 => Rom Built Recovery             -"
echo "-------------------------------------"
echo "Select Your Option & PRESS ENTER    -"
echo "-------------------------------------"
read recovery

# Option 1- OFRP
if [[ $recovery == 1 ]]
then
clear
OFRP=TRUE
RECOVERY=OrangeFox

# Option 2 - PBRP
elif [[ $recovery == 2 ]]
then
clear
PBRP=TRUE
RECOVERY=PitchBlack

# Option 3 - SHRP
elif [[ $recovery == 3 ]]
then
clear
SHRP=TRUE
RECOVERY=SkyHawk

# Option 4 - TWRP
elif [[ $recovery == 4 ]]
then
clear
TWRP=TRUE
RECOVERY=TWRP

# Option 5 - Rom Recovery
elif [[ $recovery == 5 ]]
then
clear
ROM_RECOVERY=TRUE
RECOVERY="Rom_Built_Recovery"

fi
############################

# Root Menu
echo ""
echo "=========== Root Selection =========="
echo "-------------------------------------"
echo "1 => KernelSU                       -"
echo "2 => Magisk                         -"
echo "3 => No Root                        -"
echo "-------------------------------------"
echo "Select Your Option & PRESS ENTER    -"
echo "-------------------------------------"
read root

# Option 1- KernelSU
if [[ $root == 1 ]]
then
clear
ROOT=KSU

# Option 2 - Magisk
elif [[ $root == 2 ]]
then
clear
ROOT=MAGISK

# Option 3 - No Root
elif [[ $root == 3 ]]
then
clear
ROOT=NONE

fi
############################

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
echo "Recovery Selected => $RECOVERY"
echo ""  
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
echo "Recovery Selected => $RECOVERY"
echo ""  
echo ""   
echo "Encryption => Disabled"
echo ""  
echo "" 
CRYPTO=FALSE
sleep 7
fi
############################

# Flash Recovery Choice
if [[ $OFRP == TRUE ]]
then
# Flash OrangeFox
echo "Flashing OrangeFox Recovery..."
echo ""
fastboot flash recovery OFRP.img
echo ""
echo ""

elif [[ $PBRP == TRUE ]]
then
# Flash OrangeFox
echo "Flashing PitchBlack Recovery..."
echo ""
fastboot flash recovery PBRP.img
echo ""
echo ""

elif [[ $SHRP == TRUE ]]
then
# Flash OrangeFox
echo "Flashing SkyHawk Recovery..."
echo ""
fastboot flash recovery SHRP.img
echo ""
echo ""

elif [[ $TWRP == TRUE ]]
then
# Flash OrangeFox
echo "Flashing TWRP Recovery..."
echo ""
fastboot flash recovery TWRP.img
echo ""
echo ""

elif [[ $ROM_RECOVERY == TRUE ]]
then
# Flash Rom Built Recovery
echo "Flashing Rom Built Recovery..."
echo ""
fastboot flash recovery recovery.img
echo ""
echo ""
fi

# Flash Dtbo
echo "Flashing Dtbo..."
echo ""
fastboot flash dtbo dtbo.img
echo ""
echo "" 

# Flash Vbmeta
echo "Flashing Vbmeta..."
echo ""
fastboot flash --disable-verity --disable-verification vbmeta vbmeta.img
echo ""
echo "" 

# Flash Vbmeta_System
echo "Flashing Vbmeta_System..."
echo ""
fastboot flash --disable-verity --disable-verification vbmeta_system vbmeta_system.img
echo ""
echo "" 

# Flash Empty Super
echo "Flashing Empty Super..."
echo ""
fastboot wipe-super super_empty.img
echo ""
echo "" 

# Flash Vendor_Boot
echo "Flashing Vendor_Boot..."
echo ""
fastboot flash vendor_boot vendor_boot.img
echo ""
echo "" 

# Flash Boot
echo "Flashing Boot..."
echo ""
fastboot flash boot boot.img
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

# Flash Root Choice
if [[ $ROOT == KSU ]]
then
# Flash KernelSU
echo "Flashing KernelSU Root..."
echo ""
fastboot flash boot KSU.img
echo ""
echo ""

elif [[ $ROOT == MAGISK ]]
then
# Flash Magisk
echo "Flashing Magisk Root..."
echo ""
fastboot flash boot Magisk.img
echo ""
echo ""

elif [[ $ROOT == NONE ]]
then
# Flash No Root
echo "Not Rooting Device..."
echo ""
fastboot flash boot boot.img
echo ""
echo ""
fi

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

# Flash System_Ext
echo "Flashing System_Ext..."
echo ""
fastboot flash system_ext_a system_ext.img
echo ""
echo ""

# Flash Vendor Encryption Choice
if [[ $CRYPTO == FALSE ]]
then
# Flash Disabled Encryption
echo "Flashing Encryption Disabled Vendor..."
echo ""
fastboot flash vendor_a NoEncrypt-vendor.img
echo ""
echo ""
else
# Flash Enabled Encryption
echo "Flashing Encryption Enabled Vendor..."
echo ""
fastboot flash vendor_a vendor.img
echo ""
echo ""
fi

# Flash Vendor_Dlkm
echo "Flashing Vendor_Dlkm..."
echo ""
fastboot flash vendor_dlkm_a vendor_dlkm.img
echo ""
echo ""

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
