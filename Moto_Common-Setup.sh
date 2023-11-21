#!/bin/bash

# Date
date=$(date -u +%m%d%Y)

# Print Rom Name To Terminal
echo -ne "\033]0;$(basename $(dirname ${PWD}))\007"

# Copyright & Current Date Stamp
echo "(C) 2019-Present A-Team Digital Solutions"
echo "                $date"
echo ""
echo ""
echo "Setup Version: 0.01"
echo "Setup Update: 11-21-2023"
echo ""
echo ""
sleep 10

# Check If Rom Uses Changelog & Hijack If So For Custom Changelogs
if [ -f vendor/$ROM_BUILD_NAME/tools/changelog ]; then
   echo "Rom changelog Found, Hijacking For Custom Changelog Ability..."
   # Backup Original
   mv vendor/$ROM_BUILD_NAME/tools/changelog vendor/$ROM_BUILD_NAME/tools/changelog.bak
   # Copy Modded
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/changelog vendor/$ROM_BUILD_NAME/tools
   # Copy Changelog Template Files
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Amogus Changelog.txt.Amogus
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Borneo Changelog.txt.Borneo
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Guamna Changelog.txt.Guamna
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Milanf Changelog.txt.Milanf
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Osaka Changelog.txt.Osaka
   echo ""
   sleep 5
elif [ -f vendor/$ROM_BUILD_NAME/tools/changelog.sh ]; then
   echo "Rom changelog.sh Found, Hijacking For Custom Changelog Ability..."
   # Backup Original
   mv vendor/$ROM_BUILD_NAME/tools/changelog.sh vendor/$ROM_BUILD_NAME/tools/changelog.sh.bak
   # Copy Modded
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/changelog.sh vendor/$ROM_BUILD_NAME/tools
   # Copy Changelog Template Files
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Amogus Changelog.txt.Amogus
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Borneo Changelog.txt.Borneo
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Guamna Changelog.txt.Guamna
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Milanf Changelog.txt.Milanf
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Osaka Changelog.txt.Osaka
   echo ""
   sleep 5
fi

# General Moto-Common Setup
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/A-Team device/motorola
## Patch CommonConfig.mk
sed -i '/BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true/ a BUILD_BROKEN_DUP_RULES := true' device/motorola/common/CommonConfig.mk
## Patch common.mk
sed -i '/# limitations under the License./ a\\ \nA_TEAM_PATH := device/motorola/A-Team\n\n# A-Team Custom Installer / Mods\nifeq ($(CUSTOM_INSTALLER), true)\n$(call inherit-product, $(A_TEAM_PATH)/A-Team.mk)\nPRODUCT_SOONG_NAMESPACES += \\\n    [A-Team_Installer]\nendif' device/motorola/targets/include/common.mk
# Patch Vendor Android.mk For Custom APN Selection 
sed -i 's\DEFAULT_APNS_FILE := vendor/'$ROM_BUILD_NAME'/prebuilt/common/etc/apns-conf.xml\# Custom APN Mechanism\g' vendor/$ROM_BUILD_NAME/prebuilt/common/Android.mk
sed -i '/# Custom APN Mechanism/ a \nifeq ($(CUSTOM_APN), true)\n\nDEFAULT_APNS_FILE := device/motorola/A-Team/Custom_APN/apns-conf.xml\nelse\nDEFAULT_APNS_FILE := vendor/$(ROM_BUILD_NAME)/prebuilt/common/etc/apns-conf.xml\nendif' vendor/$ROM_BUILD_NAME/prebuilt/common/Android.mk
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/sm4250-common device/motorola
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/sm4350-common device/motorola
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/sm6150-common device/motorola
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/targets/include/kernel/source.mk device/motorola/targets/include/kernel
rm -rf device/motorola/targets/scripts
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/targets/scripts device/motorola/targets
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/targets/Update_Rom_Symlinks.sh device/motorola/targets

# Check If Rom .mk File Exists, Copy If So & Then Run Symlink Script
if [ -f $A_TEAM_PACKAGE_LOCATION/device/$DT_MANUFACTURER/targets/rom/$ROM_BUILD_NAME.mk ]; then
   echo "Rom .mk File Found, Copying To Location & Running Symlink Patch..."
   # Copy Rom .mk File
   cp -r $A_TEAM_PACKAGE_LOCATION/device/$DT_MANUFACTURER/targets/rom/$ROM_BUILD_NAME.mk device/$DT_MANUFACTURER/targets/rom
   ####################
   echo ""
   echo "Updating Rom Symlinks..."
   echo ""

   ROM_DIR="device/motorola/targets/rom"
   DEVICE_DIR="device/motorola/targets/devices"

   for device in $DEVICE_DIR/*; do
     for file in $ROM_DIR/*; do
       ln -sf "../../$file" "$device/$(basename ${file%.*})_$(basename $device).mk"
     done
   done

   echo "Rom Symlinks Updated & Rom Added  =)"
   echo ""
   echo ""
   sleep 10
   clear
   ####################
else
   echo "Rom .mk File Not Found, You Will Need To Create & Run Symlink Patch..."
   echo ""
   echo ""
   sleep 10
   clear
fi


# Amogus Setup
##########################################################################################################

# Move Files To Location
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/amogus/rootdir device/motorola/amogus
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/amogus/rro_overlays device/motorola/amogus

# Patch BoardConfig.mk
sed -i 's/BOARD_EROFS_PCLUSTER_SIZE := 262144/#BOARD_EROFS_PCLUSTER_SIZE := 262144/g' device/motorola/amogus/device.mk
sed -i 's/BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs/BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4/g' device/motorola/amogus/device.mk
sed -i 's/BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs/BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4/g' device/motorola/amogus/device.mk
sed -i 's/  BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs/  BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4/g' device/motorola/amogus/device.mk

# Patch device.mk
sed -i 's/PRODUCT_MODEL := moto g(8) family/PRODUCT_MODEL := Moto G8 Family/g' device/motorola/amogus/device.mk
sed -i '/    amogus_folders/ a\\ \n# Disable Adaptive Brightness\nPRODUCT_PACKAGES += amogusSettingsProviderOverlay' device/motorola/amogus/device.mk

# Backup & Copy amogus_defconfig File
mv kernel/motorola/msm-4.14/arch/arm64/configs/vendor/amogus_defconfig kernel/motorola/msm-4.14/arch/arm64/configs/vendor/amogus_defconfig.bak
cp -r $A_TEAM_PACKAGE_LOCATION/kernel/motorola/msm-4.14/arch/arm64/configs/vendor/amogus_defconfig kernel/motorola/msm-4.14/arch/arm64/configs/vendor



# Borneo Setup
##########################################################################################################

# Move Files To Location
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/borneo/rro_overlays device/motorola/borneo

# Patch device.mk
sed -i 's\PRODUCT_MODEL := moto g power 2021\PRODUCT_MODEL := Moto G Power 2021 / G9 Power\g' device/motorola/borneo/device.mk
sed -i '/    ro.sf.lcd_density=280/ a\\ \n# Disable Adaptive Brightness\nPRODUCT_PACKAGES += borneoSettingsProviderOverlay' device/motorola/borneo/device.mk

# Backup & Copy borneo_defconfig File
mv kernel/motorola/msm-4.19-borneo/arch/arm64/configs/vendor/borneo_defconfig kernel/motorola/msm-4.19-borneo/arch/arm64/configs/vendor/borneo_defconfig.bak
cp -r $A_TEAM_PACKAGE_LOCATION/kernel/motorola/msm-4.19-borneo/arch/arm64/configs/vendor/borneo_defconfig kernel/motorola/msm-4.19-borneo/arch/arm64/configs/vendor



# Guamna Setup
##########################################################################################################

# Move Files To Location
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/guamna/rro_overlays device/motorola/guamna

# Patch device.mk
sed -i 's\PRODUCT_MODEL := moto g play 2021\PRODUCT_MODEL := Moto G Play 2021 / G9 / G9 Play\g' device/motorola/guamna/device.mk
sed -i '/    com.qti.sensormodule.mot_guam_s5k3l6_ofilm.bin/ a\\ \n# Disable Adaptive Brightness\nPRODUCT_PACKAGES += guamnaSettingsProviderOverlay' device/motorola/guamna/device.mk

# Backup & Copy guamna_defconfig File
mv kernel/motorola/msm-4.19/arch/arm64/configs/vendor/guamna_defconfig kernel/motorola/msm-4.19/arch/arm64/configs/vendor/guamna_defconfig.bak
cp -r $A_TEAM_PACKAGE_LOCATION/kernel/motorola/msm-4.19/arch/arm64/configs/vendor/guamna_defconfig kernel/motorola/msm-4.19/arch/arm64/configs/vendor



# Milanf Setup
##########################################################################################################

# Move Files To Location
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/milanf/rro_overlays device/motorola/milanf

# Patch device.mk
sed -i 's/PRODUCT_MODEL := moto g stylus 5g 2022/PRODUCT_MODEL := Moto G Stylus 5G 2022/g' device/motorola/milanf/device.mk
sed -i '/DEVICE_PATH := device/motorola/milanf/rootdir/ a\\ \n# Disable Adaptive Brightness\nPRODUCT_PACKAGES += milanfSettingsProviderOverlay' device/motorola/milanf/device.mk

# Backup & Copy milanf_defconfig File
mv kernel/motorola/msm-5.4/arch/arm64/configs/vendor/milanf_defconfig kernel/motorola/msm-5.4/arch/arm64/configs/vendor/milanf_defconfig.bak
cp -r $A_TEAM_PACKAGE_LOCATION/kernel/motorola/msm-5.4/arch/arm64/configs/vendor/milanf_defconfig kernel/motorola/msm-5.4/arch/arm64/configs/vendor



# Osaka Setup
##########################################################################################################

# Move Files To Location
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/osaka/rro_overlays device/motorola/osaka

# Patch device.mk
sed -i 's/PRODUCT_MODEL := moto g stylus 5g 2021/PRODUCT_MODEL := Moto G Stylus 5G 2021/g' device/motorola/osaka/device.mk
sed -i '/    ro.sf.lcd_density=420/ a\\ \n# Disable Adaptive Brightness\nPRODUCT_PACKAGES += osakaSettingsProviderOverlay' device/motorola/osaka/device.mk

# Backup & Copy osaka_defconfig File
mv kernel/motorola/msm-5.4/arch/arm64/configs/vendor/osaka_defconfig kernel/motorola/msm-5.4/arch/arm64/configs/vendor/osaka_defconfig.bak
cp -r $A_TEAM_PACKAGE_LOCATION/kernel/motorola/msm-5.4/arch/arm64/configs/vendor/osaka_defconfig kernel/motorola/msm-5.4/arch/arm64/configs/vendor
