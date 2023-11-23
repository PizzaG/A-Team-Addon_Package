#!/bin/bash

#
# Copyright 2019-Present A-Team Digital Solutions
#
# A-Team Moto-Common Setup Script
#

# Date
date=$(date -u +%m%d%Y)

# Print Rom Name To Terminal
echo -ne "\033]0;$(basename $(dirname ${PWD}))\007"

# Copyright & Current Date Stamp
echo "Copyright 2019-Present A-Team Digital Solutions"
echo "                $date"
echo "" 
sleep 10
clear

# Software Info
echo "A-Team Moto-Common Setup Script"
echo ""
echo ""
echo "Setup Version: 0.08"
echo "Setup Update: 11-23-2023"
echo ""
echo ""
echo "Current Date: $date"
echo ""
echo ""
sleep 10

# Ensure Final Package Directory Location Exists
echo "Creating Final Rom Directory Location..."
echo ""
echo "1/1..."
echo ""
mkdir $FINAL_ROM_LOCATION >/dev/null 2>&1
echo "Final Rom Location: $FINAL_ROM_LOCATION/YOUR_DEVICE_CODENAME"
echo ""
sleep 5

# Check If Rom Uses Changelog & Hijack It If So For Custom Changelogs
if [ -f vendor/$ROM_BUILD_NAME/tools/changelog ]; then
   echo "Rom changelog Found, Hijacking For Custom Changelog Ability..."
   echo ""
   # Backup Original
   echo "Backing Up Original changelog..."
   echo ""
   echo "1/1..."
   echo ""
   mv vendor/$ROM_BUILD_NAME/tools/changelog vendor/$ROM_BUILD_NAME/tools/changelog.bak
   sleep 5
   # Copy Modded
   echo "Copying Modified changelog..."
   echo ""
   echo "1/1..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/changelog vendor/$ROM_BUILD_NAME/tools
   sleep 5
   # Copy Changelog Template Files
   echo "Copying Device Specific Changelog Templates..."
   echo ""
   echo "1/6..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Amogus Changelog.txt.Amogus
   sleep 5
   echo "2/6..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Borneo Changelog.txt.Borneo
   sleep 5
   echo "3/6..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Guamna Changelog.txt.Guamna
   sleep 5
   echo "4/6..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Milanf Changelog.txt.Milanf
   sleep 5
   echo "5/6..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Osaka Changelog.txt.Osaka
   sleep 5
   echo "6/6..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Rhodep Changelog.txt.Rhodep
   sleep 5
elif [ -f vendor/$ROM_BUILD_NAME/tools/changelog.sh ]; then
   echo "Rom changelog.sh Found, Hijacking For Custom Changelog Ability..."
   echo ""
   # Backup Original
   echo "Backing Up Original changelog.sh..."
   echo ""
   echo "1/1..."
   echo ""
   mv vendor/$ROM_BUILD_NAME/tools/changelog.sh vendor/$ROM_BUILD_NAME/tools/changelog.sh.bak
   sleep 5
   # Copy Modded
   echo "Copying Modified changelog.sh..."
   echo ""
   echo "1/1..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/changelog.sh vendor/$ROM_BUILD_NAME/tools
   sleep 5
   # Copy Changelog Template Files
   echo "Copying Device Specific Changelog Templates..."
   echo ""
   echo "1/6..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Amogus Changelog.txt.Amogus
   sleep 5
   echo "2/6..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Borneo Changelog.txt.Borneo
   sleep 5
   echo "3/6..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Guamna Changelog.txt.Guamna
   sleep 5
   echo "4/6..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Milanf Changelog.txt.Milanf
   sleep 5
   echo "5/6..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Osaka Changelog.txt.Osaka
   sleep 5
   echo "6/6..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Rhodep Changelog.txt.Rhodep
   sleep 5
fi

# General Moto-Common Setup
echo "Copying A-Team Rom Addon Package To Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/A-Team device/motorola
sleep 5
## Patch CommonConfig.mk
echo "Patching CommonConfig.mk..."
echo ""
echo "1/1..."
echo ""
sed -i '/BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true/ a BUILD_BROKEN_DUP_RULES := true' device/motorola/common/CommonConfig.mk
sleep 5
## Patch common.mk
echo "Patching common.mk..."
echo ""
echo "1/1..."
echo ""
sed -i '/# limitations under the License./ a\\ \nA_TEAM_PATH := device/motorola/A-Team\n\n# A-Team Custom Installer / Mods\nifeq ($(CUSTOM_INSTALLER), true)\n$(call inherit-product, $(A_TEAM_PATH)/A-Team.mk)\nPRODUCT_SOONG_NAMESPACES += \\\n    [A-Team_Installer]\nendif' device/motorola/targets/include/common.mk
sleep 5
# Patch Vendor Android.mk For Custom APN Selection
echo "Patching Android.mk..."
echo "" 
echo "1/2..."
echo ""
sed -i 's\DEFAULT_APNS_FILE := vendor/'$ROM_BUILD_NAME'/prebuilt/common/etc/apns-conf.xml\# Custom APN Mechanism\g' vendor/$ROM_BUILD_NAME/prebuilt/common/Android.mk
sleep 5
echo "2/2..."
echo ""
sed -i '/# Custom APN Mechanism/ a ifeq ($(CUSTOM_APN), true)\nDEFAULT_APNS_FILE := device/motorola/A-Team/Custom_APN/apns-conf.xml\nelse\nDEFAULT_APNS_FILE := vendor/$(ROM_BUILD_NAME)/prebuilt/common/etc/apns-conf.xml\nendif' vendor/$ROM_BUILD_NAME/prebuilt/common/Android.mk
sleep 5
echo "Copying & Setting Up Modified Common Device Tree Files..."
echo ""
echo "1/7..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/sm4250-common device/motorola
sleep 5
echo "2/7..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/sm4350-common device/motorola
sleep 5
echo "3/7..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/sm6150-common device/motorola
sleep 5
echo "4/7..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/targets/include/kernel/source.mk device/motorola/targets/include/kernel
sleep 5
echo "5/7..."
echo ""
rm -rf device/motorola/targets/scripts
sleep 5
echo "6/7..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/targets/scripts device/motorola/targets
sleep 5
echo "7/7..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/targets/Update_Rom_Symlinks.sh device/motorola/targets
sleep 5

# A-Team Internal System/Vendor Version Mismatch Error Patch Check
echo "Checking If Rom Needs Internal System/Vendor Version Mismatch Error Patch..."
echo ""
if [ -f frameworks/base/core/java/android/os/Build.java.orig ]; then
   echo "A-Team Patch 1 Already Applied, Skipping..."
   echo ""
   sleep 5
elif [ -f frameworks/base/core/java/android/os/Build.java.rej ]; then
   echo "A-Team Patch 1 Already Applied, Skipping..."
   echo ""
   sleep 5
else
   echo "Rom Needs Internal System/Vendor Version Mismatch Error Patch, Patching..."
   echo ""
   echo "1/1..."
   echo ""
   patch -u -b frameworks/base/core/java/android/os/Build.java -i device/$DT_MANUFACTURER/A-Team/Build.java.patch
   sleep 5
   echo ""
fi

# Check If Rom .mk File Exists, Copy If So & Then Run Symlink Script
if [ -f $A_TEAM_PACKAGE_LOCATION/device/$DT_MANUFACTURER/targets/rom/$ROM_BUILD_NAME.mk ]; then
   echo "Checking If Rom .mk File Exists..."
   echo ""
   sleep 5
   echo "Rom .mk File Found👍..."
   echo ""
   sleep 5
   # Copy Rom .mk File
   echo "Copying Rom .mk File To Location..."
   echo ""
   echo "1/2..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/device/$DT_MANUFACTURER/targets/rom/$ROM_BUILD_NAME.mk device/$DT_MANUFACTURER/targets/rom
   sleep 5
   ####################
   # Update Moto-Common Device Symlinks
   cd device/$DT_MANUFACTURER/targets
   ./Update_Rom_Symlinks.sh
   cd ../../../
   ####################
else
   echo "Rom .mk File Not Found"
   echo "You Will Need To Create It Manually"
   echo "Then Run Update_Rom_Symlinks.sh Patch In Targets Folder"
   echo ""
   sleep 5
fi


# Amogus Setup
##########################################################################################################

# Move Files To Location
echo "Copying Amogus Files Into Device Tree..."
echo ""
echo "1/2..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/amogus/rootdir device/motorola/amogus
sleep 5
echo "2/2..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/amogus/rro_overlays device/motorola/amogus
sleep 5

# Patch BoardConfig.mk
echo "Patching Amogus BoardConfig.mk In Device Tree..."
echo ""
echo "1/4..."
echo ""
sed -i 's/BOARD_EROFS_PCLUSTER_SIZE := 262144/#BOARD_EROFS_PCLUSTER_SIZE := 262144/g' device/motorola/amogus/BoardConfig.mk
sleep 5
echo "2/4..."
echo ""
sed -i 's/BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs/BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4/g' device/motorola/amogus/BoardConfig.mk
sleep 5
echo "3/4..."
echo ""
sed -i 's/BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs/BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4/g' device/motorola/amogus/BoardConfig.mk
sleep 5
echo "4/4..."
echo ""
sed -i 's/  BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs/  BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4/g' device/motorola/amogus/BoardConfig.mk
sleep 5

# Patch device.mk
echo "Patching Amogus device.mk In Device Tree..."
echo ""
echo "1/2..."
echo ""
sed -i 's/PRODUCT_MODEL := moto g(8) family/PRODUCT_MODEL := Moto G8 Family/g' device/motorola/amogus/device.mk
sleep 5
echo "2/2..."
echo ""
sed -i '/    amogus_folders/ a\\ \n# Disable Adaptive Brightness\nPRODUCT_PACKAGES += amogusSettingsProviderOverlay' device/motorola/amogus/device.mk
sleep 5

# Backup & Copy amogus_defconfig File
echo "Backing Up Original amogus_defconfig In Device Tree..."
echo ""
echo "1/1..."
echo ""
mv kernel/motorola/msm-4.14/arch/arm64/configs/vendor/amogus_defconfig kernel/motorola/msm-4.14/arch/arm64/configs/vendor/amogus_defconfig.bak
sleep 5
echo "Copying Modified amogus_defconfig Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/kernel/motorola/msm-4.14/arch/arm64/configs/vendor/amogus_defconfig kernel/motorola/msm-4.14/arch/arm64/configs/vendor
sleep 5



# Borneo Setup
##########################################################################################################

# Move Files To Location
echo "Copying Borneo Files Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/borneo/rro_overlays device/motorola/borneo
sleep 5

# Patch device.mk
echo "Patching Borneo device.mk In Device Tree..."
echo ""
echo "1/2..."
echo ""
sed -i 's\PRODUCT_MODEL := moto g power 2021\PRODUCT_MODEL := Moto G Power 2021 / G9 Power\g' device/motorola/borneo/device.mk
sleep 5
echo "2/2..."
echo ""
sed -i '/    ro.sf.lcd_density=280/ a\\ \n# Disable Adaptive Brightness\nPRODUCT_PACKAGES += borneoSettingsProviderOverlay' device/motorola/borneo/device.mk
sleep 5

# Backup & Copy borneo_defconfig File
echo "Backing Up Original borneo_defconfig In Device Tree..."
echo ""
echo "1/1..."
echo ""
mv kernel/motorola/msm-4.19-borneo/arch/arm64/configs/vendor/borneo_defconfig kernel/motorola/msm-4.19-borneo/arch/arm64/configs/vendor/borneo_defconfig.bak
sleep 5
echo "Copying Modified borneo_defconfig Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/kernel/motorola/msm-4.19-borneo/arch/arm64/configs/vendor/borneo_defconfig kernel/motorola/msm-4.19-borneo/arch/arm64/configs/vendor
sleep 5



# Guamna Setup
##########################################################################################################

# Move Files To Location
echo "Copying Guamna Files Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/guamna/rro_overlays device/motorola/guamna
sleep 5

# Patch device.mk
echo "Patching Guamna device.mk In Device Tree..."
echo ""
echo "1/2..."
echo ""
sed -i 's\PRODUCT_MODEL := moto g play 2021\PRODUCT_MODEL := Moto G Play 2021 / G9 / G9 Play\g' device/motorola/guamna/device.mk
sleep 5
echo "2/2..."
echo ""
sed -i '/    com.qti.sensormodule.mot_guam_s5k3l6_ofilm.bin/ a\\ \n# Disable Adaptive Brightness\nPRODUCT_PACKAGES += guamnaSettingsProviderOverlay' device/motorola/guamna/device.mk
sleep 5

# Backup & Copy guamna_defconfig File
echo "Backing Up Original guamna_defconfig In Device Tree..."
echo ""
echo "1/1..."
echo ""
mv kernel/motorola/msm-4.19/arch/arm64/configs/vendor/guamna_defconfig kernel/motorola/msm-4.19/arch/arm64/configs/vendor/guamna_defconfig.bak
sleep 5
echo "Copying Modified guamna_defconfig Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/kernel/motorola/msm-4.19/arch/arm64/configs/vendor/guamna_defconfig kernel/motorola/msm-4.19/arch/arm64/configs/vendor
sleep 5



# Milanf Setup
##########################################################################################################

# Move Files To Location
echo "Copying Milanf Files Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/milanf/rro_overlays device/motorola/milanf
sleep 5

# Patch device.mk
echo "Patching Milanf device.mk In Device Tree..."
echo ""
echo "1/2..."
echo ""
sed -i 's/PRODUCT_MODEL := moto g stylus 5g 2022/PRODUCT_MODEL := Moto G Stylus 5G 2022/g' device/motorola/milanf/device.mk
sleep 5
echo "2/2..."
echo ""
sed -i '/DEVICE_CHARACTERISTICS += hfr/ a\\ \n# Disable Adaptive Brightness\nPRODUCT_PACKAGES += milanfSettingsProviderOverlay' device/motorola/milanf/device.mk
sleep 5

# Backup & Copy milanf_defconfig File
echo "Backing Up Original milanf_defconfig In Device Tree..."
echo ""
echo "1/1..."
echo ""
mv kernel/motorola/msm-5.4/arch/arm64/configs/vendor/milanf_defconfig kernel/motorola/msm-5.4/arch/arm64/configs/vendor/milanf_defconfig.bak
sleep 5
echo "Copying Modified milanf_defconfig Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/kernel/motorola/msm-5.4/arch/arm64/configs/vendor/milanf_defconfig kernel/motorola/msm-5.4/arch/arm64/configs/vendor
sleep 5



# Osaka Setup
##########################################################################################################

# Move Files To Location
echo "Copying Osaka Files Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/osaka/rro_overlays device/motorola/osaka
sleep 5

# Patch device.mk
echo "Patching Osaka device.mk In Device Tree..."
echo ""
echo "1/2..."
echo ""
sed -i 's/PRODUCT_MODEL := moto g stylus 5g 2021/PRODUCT_MODEL := Moto G Stylus 5G 2021/g' device/motorola/osaka/device.mk
sleep 5
echo "2/2..."
echo ""
sed -i '/    ro.sf.lcd_density=420/ a\\ \n# Disable Adaptive Brightness\nPRODUCT_PACKAGES += osakaSettingsProviderOverlay' device/motorola/osaka/device.mk
sleep 5

# Backup & Copy osaka_defconfig File
echo "Backing Up Original osaka_defconfig In Device Tree..."
echo ""
echo "1/1..."
echo ""
mv kernel/motorola/msm-5.4/arch/arm64/configs/vendor/osaka_defconfig kernel/motorola/msm-5.4/arch/arm64/configs/vendor/osaka_defconfig.bak
sleep 5
echo "Copying Modified osaka_defconfig Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/kernel/motorola/msm-5.4/arch/arm64/configs/vendor/osaka_defconfig kernel/motorola/msm-5.4/arch/arm64/configs/vendor
sleep 5


# Rhodep Setup
##########################################################################################################

# Move Files To Location
echo "Copying Rhodep Files Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/rhodep/rro_overlays device/motorola/rhodep
sleep 5

# Patch device.mk
echo "Patching Rhodep device.mk In Device Tree..."
echo ""
echo "1/2..."
echo ""
sed -i 's/PRODUCT_MODEL := moto g(82)/PRODUCT_MODEL := Moto G82 5G/g' device/motorola/rhodep/device.mk
sleep 5
echo "2/2..."
echo ""
sed -i '/DEVICE_CHARACTERISTICS += hfr/ a\\ \n# Disable Adaptive Brightness\nPRODUCT_PACKAGES += rhodepSettingsProviderOverlay' device/motorola/rhodep/device.mk
sleep 5

# Backup & Copy rhodep_defconfig File
echo "Backing Up Original rhodep_defconfig In Device Tree..."
echo ""
echo "1/1..."
echo ""
mv kernel/motorola/msm-5.4/arch/arm64/configs/vendor/rhodep_defconfig kernel/motorola/msm-5.4/arch/arm64/configs/vendor/rhodep_defconfig.bak >/dev/null 2>&1
sleep 5
echo "Copying Modified rhodep_defconfig Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/kernel/motorola/msm-5.4/arch/arm64/configs/vendor/rhodep_defconfig kernel/motorola/msm-5.4/arch/arm64/configs/vendor
sleep 5


##########################################################################################################
echo ""
echo "A-Team Moto-Common Setup Complete, Please Enjoy!!"
echo ""
echo ""
echo "PRESS ENTER TO CONTINUE"
read
clear
./Moto-Common-Build.sh
