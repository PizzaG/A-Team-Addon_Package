#!/bin/bash

# Variables
INSTALLER_VERSION="0.16"
APP_NAME="A-Team Custom Rom Installer - Version: $INSTALLER_VERSION" 

# Print App Name To Terminal
echo -ne "\033]0;$APP_NAME\007"

# Main Menu
echo ""
echo "  2019-Present A-Team Digital Solutions"
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
echo "-       Installer Version: $INSTALLER_VERSION          -"
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
echo "-                                  -"
echo "------------------------------------"
fastboot getvar current-slot
echo "------------------------------------"
echo "-                                  -"
echo "------------------------------------"
echo "===================================="
echo ""
echo ""
echo "PRESS ENTER TO CONTINUE"
read

clear

# Recovery Menu
menu_recovery() {
echo -e "\n========= Recovery Selection ========"
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
case $recovery in
    # Option 1- OFRP
    1) clear; OFRP=TRUE; RECOVERY=OrangeFox;;
    # Option 2 - PBRP
    2) clear; PBRP=TRUE; RECOVERY=PitchBlack;;
    # Option 3 - SHRP
    3) clear; SHRP=TRUE; RECOVERY=SkyHawk;;
    # Option 4 - TWRP
    4) clear; TWRP=TRUE; RECOVERY=TWRP;;
    # Option 5 - Rom Recovery
    5) clear; ROM_RECOVERY=TRUE;;
    *)echo "Invalid Option. Please Select 1, 2, 3, 4 or 5"; sleep 5; clear; menu_recovery;;
esac
}
############################

# Root Menu
menu_root() {
echo -e "\n=========== Root Selection =========="
echo "-------------------------------------"
echo "1 => KernelSU                       -"
echo "2 => Magisk                         -"
echo "3 => No Root                        -"
echo "-------------------------------------"
echo "Select Your Option & PRESS ENTER    -"
echo "-------------------------------------"
read root
case $root in
    # Option 1- KernelSU
    1) clear; ROOT=KSU;;
    # Option 2 - Magisk
    2) clear; ROOT=MAGISK;;
    # Option 3 - No Root
    3) clear; ROOT=NONE;;
    *)echo "Invalid Option. Please Select 1, 2 or 3"; sleep 5; clear; menu_root;;
esac
}
############################

# Encryption Menu
menu_encryption() {
echo -e "\n======== Encryption Selection ======="
echo "-------------------------------------"
echo "1 => Keep Encryption                -"
echo "2 => Disable Encryption             -"
echo "-------------------------------------"
echo "Select Your Option & PRESS ENTER    -"
echo "-------------------------------------"
read crypto
case $crypto in
    # Option 1 - Keep Encryption
    1) clear; echo ""; echo "Recovery Selected => $RECOVERY"; echo ""; echo "Root Option Selected => $ROOT"; echo ""; echo "Encryption => Enabled"; echo ""; sleep 7;;
    # Option 2 - Disable Encryption
    2) clear; echo ""; echo "Recovery Selected => $RECOVERY"; echo ""; echo "Root Option Selected => $ROOT"; echo ""; echo "Encryption => Disabled"; echo ""; CRYPTO=FALSE; sleep 7;;
    *)echo "Invalid Option. Please Select 1 or 2"; sleep 5; clear; menu_encryption;;
esac
}
############################

menu_recovery
menu_root
menu_encryption

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
echo "Flashing Dtbo..."; echo ""; fastboot flash dtbo dtbo.img; echo ""; echo "" 

# Flash Vbmeta
echo "Flashing Vbmeta..."; echo ""; fastboot flash --disable-verity --disable-verification vbmeta vbmeta.img; echo ""; echo "" 

# Flash Vbmeta_System
echo "Flashing Vbmeta_System..."; echo ""; fastboot flash --disable-verity --disable-verification vbmeta_system vbmeta_system.img; echo ""; echo "" 

# Flash Empty Super
echo "Flashing Empty Super..."; echo ""; fastboot wipe-super super_empty.img; echo ""; echo "" 

# Flash Vendor_Boot
echo "Flashing Vendor_Boot..."; echo ""; fastboot flash vendor_boot vendor_boot.img; echo ""; echo "" 

# Flash Boot
echo "Flashing Boot..."; echo ""; fastboot flash boot boot.img; echo ""; echo "" 

# Format Data & Metadata
echo "Formatting Data & Metadata..."; sleep 7; echo ""; fastboot -w; echo ""; echo ""

# Reboot Device
fastboot reboot fastboot; echo ""; echo ""

# Flash Root Choice
if [[ $ROOT == KSU ]]
then
# Flash KernelSU
echo "Flashing KernelSU Root..."
echo ""
fastboot flash boot KSU.img

elif [[ $ROOT == MAGISK ]]
then
# Flash Magisk
echo "Flashing Magisk Root..."
echo ""
fastboot flash boot Magisk.img

elif [[ $ROOT == NONE ]]
then
# Flash No Root
echo "Not Rooting Device..."
echo ""
fastboot flash boot boot.img
fi

# Flash Product
echo ""; echo ""; echo "Flashing Product..."; echo ""; fastboot flash product_a product.img; echo ""; echo ""

# Flash System
echo "Flashing System..."; echo ""; fastboot flash system_a system.img; echo ""; echo ""

# Flash System_Ext
echo "Flashing System_Ext..."; echo ""; fastboot flash system_ext_a system_ext.img; echo ""; echo ""

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
echo "Flashing Vendor_Dlkm..."; echo ""; fastboot flash vendor_dlkm_a vendor_dlkm.img; echo ""; echo ""

# Reboot Device
fastboot reboot; echo ""; echo ""; sleep 3;

echo "=== THANK YOU ===== PLEASE ENJOY ==="
echo "------------------------------------"
echo "======= PRESS ENTER TO EXIT ========"
read
