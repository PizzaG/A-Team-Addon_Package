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
echo "Root Option Selected => $ROOT"
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
echo "Root Option Selected => $ROOT"
echo ""  
echo "" 
echo "Encryption => Disabled"
echo ""  
echo "" 
CRYPTO=FALSE
sleep 7
fi
############################

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

# Flash Root / Recovery Choice
if [[ $ROOT == KSU ]]
then
# Flash KernelSU OFRP
if [[ $OFRP == TRUE ]]
then
echo "Flashing KernelSU Root & OrangeFox Recovery..."
echo ""
fastboot flash boot KSU-OFRP.img
fi
# Flash KernelSU PBRP
if [[ $PBRP == TRUE ]]
then
echo "Flashing KernelSU Root & PitchBlack Recovery..."
echo ""
fastboot flash boot KSU-PBRP.img
fi
# Flash KernelSU SHRP
if [[ $SHRP == TRUE ]]
then
echo "Flashing KernelSU Root & SkyHawk Recovery..."
echo ""
fastboot flash boot KSU-SHRP.img
fi
# Flash KernelSU TWRP
if [[ $TWRP == TRUE ]]
then
echo "Flashing KernelSU Root & TWRP Recovery..."
echo ""
fastboot flash boot KSU-TWRP.img
fi
# Flash KernelSU Rom Built Recovery
if [[ $ROM_RECOVERY == TRUE ]]
then
echo "Flashing KernelSU Root & Rom Built Recovery..."
echo ""
fastboot flash boot KSU.img
fi

elif [[ $ROOT == MAGISK ]]
then
# Flash Magisk OFRP
if [[ $OFRP == TRUE ]]
then
echo "Flashing Magisk Root & OrangeFox Recovery..."
echo ""
fastboot flash boot Magisk-OFRP.img
fi
# Flash Magisk PBRP
if [[ $PBRP == TRUE ]]
then
echo "Flashing Magisk Root & PitchBlack Recovery..."
echo ""
fastboot flash boot Magisk-PBRP.img
fi
# Flash Magisk SHRP
if [[ $SHRP == TRUE ]]
then
echo "Flashing Magisk Root & SkyHawk Recovery..."
echo ""
fastboot flash boot Magisk-SHRP.img
fi
# Flash Magisk TWRP
if [[ $TWRP == TRUE ]]
then
echo "Flashing Magisk Root & TWRP Recovery..."
echo ""
fastboot flash boot Magisk-TWRP.img
fi
# Flash Magisk Rom Built Recovery
if [[ $ROM_RECOVERY == TRUE ]]
then
echo "Flashing Magisk Root & Rom Built Recovery..."
echo ""
fastboot flash boot Magisk.img
fi

elif [[ $ROOT == NONE ]]
then
# Flash Unrooted OFRP
if [[ $OFRP == TRUE ]]
then
echo "Flashing Unrooted Boot Image & OrangeFox Recovery..."
echo ""
fastboot flash boot Boot-OFRP.img
fi
# Flash Unrooted PBRP
if [[ $PBRP == TRUE ]]
then
echo "Flashing Unrooted Boot Image & PitchBlack Recovery..."
echo ""
fastboot flash boot Boot-PBRP.img
fi
# Flash Unrooted SHRP
if [[ $SHRP == TRUE ]]
then
echo "Flashing Unrooted Boot Image & SkyHawk Recovery..."
echo ""
fastboot flash boot Boot-SHRP.img
fi
# Flash Unrooted TWRP
if [[ $TWRP == TRUE ]]
then
echo "Flashing Unrooted Boot Image & TWRP Recovery..."
echo ""
fastboot flash boot Boot-TWRP.img
fi
# Flash Magisk Rom Built Recovery
if [[ $ROM_RECOVERY == TRUE ]]
then
echo "Flashing Unrooted Boot Image & Rom Built Recovery..."
echo ""
fastboot flash boot boot.img
fi
fi

# Flash Product
echo ""
echo ""
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
