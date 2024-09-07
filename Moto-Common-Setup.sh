#!/bin/bash

#
# Copyright 2019-Present A-Team Digital Solutions
#
# A-Team Moto-Common Setup Script
#

APP_NAME="A-Team Moto-Common Setup Script" 
SETUP_VERSION="0.21"
SETUP_DATE="9-7-2024"

# Date
date=$(date -u +%-m/%d/%Y)

# Print App Name To Terminal
echo -ne "\033]0;$APP_NAME\007"
    
# Copyright & Current Date Stamp
echo ""
echo "Copyright 2019-Present A-Team Digital Solutions"
echo "                $date"
echo "" 
sleep 5
clear

# Software Info
echo ""
echo "A-Team Moto-Common Setup Script"
echo ""
echo ""
echo "Setup Version: $SETUP_VERSION"
echo "Setup Update: $SETUP_DATE"
echo ""
echo ""
echo "Current Date: $date"
echo ""
echo ""
sleep 5

# Ensure Final Package Directory Location Exists
echo "Creating Final Rom Directory Location..."
echo ""
echo "1/1..."
echo ""
mkdir $FINAL_ROM_LOCATION >/dev/null 2>&1
echo "Final Rom Location: $FINAL_ROM_LOCATION/YOUR_DEVICE_CODENAME"
echo ""
sleep 3

# Check If Rom Uses Changelog & Hijack It If So For Custom Changelogs
if [ -f vendor/$ROM_VENDOR_NAME/tools/changelog ]; then
   mkdir A-Team_Changelog
   echo "Rom changelog Found, Hijacking For Custom Changelog Ability..."
   echo ""
   # Backup Original
   echo "Backing Up Original changelog..."
   echo ""
   echo "1/1..."
   echo ""
   mv vendor/$ROM_VENDOR_NAME/tools/changelog vendor/$ROM_VENDOR_NAME/tools/changelog.bak
   sleep 3
   # Copy Modded
   echo "Copying Modified changelog..."
   echo ""
   echo "1/1..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/changelog vendor/$ROM_VENDOR_NAME/tools
   sleep 3
   # Copy Changelog Template Files
   echo "Copying Device Specific Changelog Templates..."
   echo ""
   echo "1/7..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Amogus A-Team_Changelog/Changelog.txt.Amogus
   sleep 3
   echo "2/7..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Borneo A-Team_Changelog/Changelog.txt.Borneo
   sleep 3
   echo "3/7..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Guamna A-Team_Changelog/Changelog.txt.Guamna
   sleep 3
   echo "4/7..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Hanoip A-Team_Changelog/Changelog.txt.Hanoip
   sleep 3
   echo "5/7..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Milanf A-Team_Changelog/Changelog.txt.Milanf
   sleep 3
   echo "6/7..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Osaka A-Team_Changelog/Changelog.txt.Osaka
   sleep 3
   echo "7/7..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Yume A-Team_Changelog/Changelog.txt.Yume
   sleep 3
elif [ -f vendor/$ROM_VENDOR_NAME/tools/changelog.sh ]; then
   mkdir A-Team_Changelog
   echo "Rom changelog.sh Found, Hijacking For Custom Changelog Ability..."
   echo ""
   # Backup Original
   echo "Backing Up Original changelog.sh..."
   echo ""
   echo "1/1..."
   echo ""
   mv vendor/$ROM_VENDOR_NAME/tools/changelog.sh vendor/$ROM_VENDOR_NAME/tools/changelog.sh.bak
   sleep 3
   # Copy Modded
   echo "Copying Modified changelog.sh..."
   echo ""
   echo "1/1..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/changelog.sh vendor/$ROM_VENDOR_NAME/tools
   sleep 3
   # Copy Changelog Template Files
   echo "Copying Device Specific Changelog Templates..."
   echo ""
   echo "1/7..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Amogus A-Team_Changelog/Changelog.txt.Amogus
   sleep 3
   echo "2/7..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Borneo A-Team_Changelog/Changelog.txt.Borneo
   sleep 3
   echo "3/7..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Guamna A-Team_Changelog/Changelog.txt.Guamna
   sleep 3
   echo "4/7..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Hanoip A-Team_Changelog/Changelog.txt.Hanoip
   sleep 3
   echo "5/7..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Milanf A-Team_Changelog/Changelog.txt.Milanf
   sleep 3
   echo "6/7..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Osaka A-Team_Changelog/Changelog.txt.Osaka
   sleep 3
   echo "7/7..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Yume A-Team_Changelog/Changelog.txt.Yume
   sleep 3
elif [ -f vendor/$ROM_VENDOR_NAME/build/tools/changelog.sh ]; then
   mkdir A-Team_Changelog
   echo "Rom changelog.sh Found, Hijacking For Custom Changelog Ability..."
   echo ""
   # Backup Original
   echo "Backing Up Original changelog.sh..."
   echo ""
   echo "1/1..."
   echo ""
   mv vendor/$ROM_VENDOR_NAME/build/tools/changelog.sh vendor/$ROM_VENDOR_NAME/build/tools/changelog.sh.bak
   sleep 3
   # Copy Modded
   echo "Copying Modified changelog.sh..."
   echo ""
   echo "1/1..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/changelog.sh vendor/$ROM_VENDOR_NAME/build/tools
   sleep 3
   # Copy Changelog Template Files
   echo "Copying Device Specific Changelog Templates..."
   echo ""
   echo "1/7..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Amogus A-Team_Changelog/Changelog.txt.Amogus
   sleep 3
   echo "2/7..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Borneo A-Team_Changelog/Changelog.txt.Borneo
   sleep 3
   echo "3/7..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Guamna A-Team_Changelog/Changelog.txt.Guamna
   sleep 3
   echo "4/7..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Hanoip A-Team_Changelog/Changelog.txt.Hanoip
   sleep 3
   echo "5/7..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Milanf A-Team_Changelog/Changelog.txt.Milanf
   sleep 3
   echo "6/7..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Osaka A-Team_Changelog/Changelog.txt.Osaka
   sleep 3
   echo "7/7..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/Changelog/Changelog.txt.Yume A-Team_Changelog/Changelog.txt.Yume
   sleep 3
fi

# General Moto-Common Setup
echo "Copying A-Team Rom Addon Package To Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/A-Team device/motorola
sleep 3
echo "Copying A-Team Telegram Bot Folder To Rom Root..."
echo ""
echo "1/2..."
echo ""
mkdir Telegram_Bots
echo "2/2..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/Telegram_Bots/* Telegram_Bots
sleep 3
## Patch CommonConfig.mk
echo "Patching CommonConfig.mk..."
echo ""
echo "1/1..."
echo ""
sed -i '/BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true/ a BUILD_BROKEN_DUP_RULES := true' device/motorola/common/CommonConfig.mk
sleep 3
## Patch common.mk
echo "Patching common.mk..."
echo ""
echo "1/1..."
echo ""
sed -i '/# limitations under the License./ a\\ \nA_TEAM_PATH := device/motorola/A-Team\n\n# A-Team Custom Installer / Mods\nifeq ($(CUSTOM_INSTALLER), Custom)\n$(call inherit-product, $(A_TEAM_PATH)/A-Team.mk)\nPRODUCT_SOONG_NAMESPACES += \\\n    [A-Team_Installer]\nendif' device/motorola/targets/include/common.mk
sleep 3
# Patch Vendor Android.mk For Custom APN Selection
echo "Patching Android.mk..."
echo "" 
echo "1/2..."
echo ""
sed -i 's\DEFAULT_APNS_FILE := vendor/'$ROM_VENDOR_NAME'/prebuilt/common/etc/apns-conf.xml\# Custom APN Mechanism\g' vendor/$ROM_VENDOR_NAME/prebuilt/common/Android.mk
sleep 3
echo "2/2..."
echo ""
sed -i '/# Custom APN Mechanism/ a ifeq ($(CUSTOM_APN), Custom)\nDEFAULT_APNS_FILE := device/motorola/A-Team/Custom_APN/apns-conf.xml\nelse\nDEFAULT_APNS_FILE := vendor/$(ROM_VENDOR_NAME)/prebuilt/common/etc/apns-conf.xml\nendif' vendor/$ROM_VENDOR_NAME/prebuilt/common/Android.mk
sleep 3
echo "Copying & Setting Up Modified Common Device Tree Files..."
echo ""
echo "1/8..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/sm4250-common device/motorola
sleep 3
echo "2/8..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/sm4350-common device/motorola
sleep 3
echo "3/8..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/sm6150-common device/motorola
sleep 3
echo "4/8..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/sm6450-common device/motorola
sleep 3
echo "5/8..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/targets/include/kernel/source.mk device/motorola/targets/include/kernel
sleep 3
echo "6/8..."
echo ""
rm -rf device/motorola/targets/scripts
sleep 3
echo "7/8..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/targets/scripts device/motorola/targets
sleep 3
echo "8/8..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/targets/Update_Rom_Symlinks.sh device/motorola/targets
sleep 3

## Patch Rom Camera SePolicy
echo "Patching Rom Camera SePolicy..."
echo ""
echo "1/1..."
./device/motorola/targets/scripts/replace_camera_sepolicy.sh
sleep 3

# A-Team Internal System/Vendor Version Mismatch Error Patch Check
echo "Checking If Rom Needs Internal System/Vendor Version Mismatch Error Patch..."
echo ""
if [ -f frameworks/base/core/java/android/os/Build.java.orig ]; then
   echo "A-Team Patch 1 Already Applied, Skipping..."
   echo ""
   sleep 3
#elif [ -f frameworks/base/core/java/android/os/Build.java.rej ]; then
#   echo "A-Team Patch 1 Already Applied, Skipping..."
#   echo ""
#   sleep 3
else
   echo "Rom Needs Internal System/Vendor Version Mismatch Error Patch, Patching..."
   echo ""
   echo "1/1..."
   echo ""
   patch -u -b frameworks/base/core/java/android/os/Build.java -i device/$DT_MANUFACTURER/A-Team/Build.java.patch

   sleep 3
   echo ""
   # Sanity Check
   if [ -f frameworks/base/core/java/android/os/Build.java.rej ]; then
      echo "Patch Failed, Trying Alternate Patch File..."
      echo ""
      rm -rf frameworks/base/core/java/android/os/Build.java
      rm -rf frameworks/base/core/java/android/os/Build.java.rej
      mv frameworks/base/core/java/android/os/Build.java.orig frameworks/base/core/java/android/os/Build.java
      patch -u -b frameworks/base/core/java/android/os/Build.java -i device/$DT_MANUFACTURER/A-Team/Build.java-alt.patch
      echo ""
   fi
   if [ -f frameworks/base/core/java/android/os/Build.java.rej ]; then
      echo "Patch Failed, Trying Alternate 1 Patch File..."
      echo ""
      rm -rf frameworks/base/core/java/android/os/Build.java
      rm -rf frameworks/base/core/java/android/os/Build.java.rej
      mv frameworks/base/core/java/android/os/Build.java.orig frameworks/base/core/java/android/os/Build.java
      patch -u -b frameworks/base/core/java/android/os/Build.java -i device/$DT_MANUFACTURER/A-Team/Build.java-alt-1.patch
      echo ""
   fi
   if [ -f frameworks/base/core/java/android/os/Build.java.rej ]; then
      echo "Patch Failed, Trying Alternate 2 Patch File..."
      echo ""
      rm -rf frameworks/base/core/java/android/os/Build.java
      rm -rf frameworks/base/core/java/android/os/Build.java.rej
      mv frameworks/base/core/java/android/os/Build.java.orig frameworks/base/core/java/android/os/Build.java
      patch -u -b frameworks/base/core/java/android/os/Build.java -i device/$DT_MANUFACTURER/A-Team/Build.java-alt-2.patch
      echo ""
   fi
   if [ -f frameworks/base/core/java/android/os/Build.java.rej ]; then
      echo "FAILED, Please Read --> README-VersionMismatchFix.txt..."
      echo ""
      gnome-terminal -- bash -c "cat device/motorola/A-Team/README-VersionMismatchFix.txt; exec bash"
      echo ""
      echo "PRESS ENTER TO CONTINUE"
      read
   fi
fi

# Check If Rom .mk File Exists, Copy If So & Then Run Symlink Script
if [ -f $A_TEAM_PACKAGE_LOCATION/ROM_MK_FILES/$A_TEAM_MK_NAME ]; then
   echo "Checking If Rom .mk File Exists..."
   echo ""
   sleep 3
   echo "Rom .mk File Found👍..."
   echo ""
   sleep 3
   # Copy Rom .mk File
   echo "Copying Rom .mk File To Location..."
   echo ""
   echo "1/1..."
   echo ""
   cp -r $A_TEAM_PACKAGE_LOCATION/ROM_MK_FILES/$A_TEAM_MK_NAME device/$DT_MANUFACTURER/targets/rom/${ROM_BUILD_NAME}.mk
   sleep 3
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
   sleep 3
fi


# Amogus Setup
##########################################################################################################

# Move Files To Location
echo "Copying Amogus Files Into Device Tree..."
echo ""
echo "1/2..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/amogus/rootdir device/motorola/amogus
sleep 3
echo "2/2..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/amogus/rro_overlays device/motorola/amogus
sleep 3

# Patch BoardConfig.mk
echo "Patching Amogus BoardConfig.mk In Device Tree..."
echo ""
echo "1/4..."
echo ""
sed -i 's/BOARD_EROFS_PCLUSTER_SIZE := 262144/#BOARD_EROFS_PCLUSTER_SIZE := 262144/g' device/motorola/amogus/BoardConfig.mk
sleep 3
echo "2/4..."
echo ""
sed -i 's/BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs/BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4/g' device/motorola/amogus/BoardConfig.mk
sleep 3
echo "3/4..."
echo ""
sed -i 's/BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs/BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4/g' device/motorola/amogus/BoardConfig.mk
sleep 3
echo "4/4..."
echo ""
sed -i 's/  BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs/  BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4/g' device/motorola/amogus/BoardConfig.mk
sleep 3

# Patch device.mk
echo "Patching Amogus device.mk In Device Tree..."
echo ""
echo "1/2..."
echo ""
sed -i 's/PRODUCT_MODEL := moto g(8) family/PRODUCT_MODEL := Moto G8 Family/g' device/motorola/amogus/device.mk
sleep 3
echo "2/2..."
echo ""
sed -i '/    amogus_folders/ a\\ \n# Disable Adaptive Brightness\nPRODUCT_PACKAGES += amogusSettingsProviderOverlay' device/motorola/amogus/device.mk
sleep 3

# Backup & Copy amogus_defconfig File
echo "Backing Up Original amogus_defconfig In Device Tree..."
echo ""
echo "1/1..."
echo ""
mv kernel/motorola/msm-4.14/arch/arm64/configs/vendor/amogus_defconfig kernel/motorola/msm-4.14/arch/arm64/configs/vendor/amogus_defconfig.bak
sleep 3
echo "Copying Modified amogus_defconfig Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/kernel/motorola/msm-4.14/arch/arm64/configs/vendor/amogus_defconfig kernel/motorola/msm-4.14/arch/arm64/configs/vendor
sleep 3

# Patch For Dirty Kernel
echo "Applying Dirty Kernel Patch..."
echo ""
echo "1/2..."
echo ""
cd kernel/motorola/msm-4.14
git add .
sleep 5
echo "2/2..."
echo ""
git commit -m "tmp"
echo ""
sleep 3
cd ../../../



# Borneo Setup
##########################################################################################################

# Move Files To Location
echo "Copying Borneo Files Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/borneo/rro_overlays device/motorola/borneo
sleep 3

# Patch device.mk
echo "Patching Borneo device.mk In Device Tree..."
echo ""
echo "1/2..."
echo ""
sed -i 's\PRODUCT_MODEL := moto g power 2021\PRODUCT_MODEL := Moto G Power 2021 / G9 Power\g' device/motorola/borneo/device.mk
sleep 3
echo "2/2..."
echo ""
sed -i '/    ro.sf.lcd_density=280/ a\\ \n# Disable Adaptive Brightness\nPRODUCT_PACKAGES += borneoSettingsProviderOverlay' device/motorola/borneo/device.mk
sleep 3

# Backup & Copy borneo_defconfig File
echo "Backing Up Original borneo_defconfig In Device Tree..."
echo ""
echo "1/1..."
echo ""
mv kernel/motorola/msm-4.19-borneo/arch/arm64/configs/vendor/borneo_defconfig kernel/motorola/msm-4.19-borneo/arch/arm64/configs/vendor/borneo_defconfig.bak
sleep 3
echo "Copying Modified borneo_defconfig Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/kernel/motorola/msm-4.19-borneo/arch/arm64/configs/vendor/borneo_defconfig kernel/motorola/msm-4.19-borneo/arch/arm64/configs/vendor
sleep 3

# Patch For Dirty Kernel
echo "Applying Dirty Kernel Patch..."
echo ""
echo "1/2..."
echo ""
cd kernel/motorola/msm-4.19-borneo
git add .
sleep 3
echo "2/2..."
echo ""
git commit -m "tmp"
echo ""
sleep 3
cd ../../../



# Guamna Setup
##########################################################################################################

# Move Files To Location
echo "Copying Guamna Files Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/guamna/rro_overlays device/motorola/guamna
sleep 3

# Patch device.mk
echo "Patching Guamna device.mk In Device Tree..."
echo ""
echo "1/2..."
echo ""
sed -i 's\PRODUCT_MODEL := moto g play 2021\PRODUCT_MODEL := Moto G Play 2021 / G9 / G9 Play\g' device/motorola/guamna/device.mk
sleep 3
echo "2/2..."
echo ""
sed -i '/    com.qti.sensormodule.mot_guam_s5k3l6_ofilm.bin/ a\\ \n# Disable Adaptive Brightness\nPRODUCT_PACKAGES += guamnaSettingsProviderOverlay' device/motorola/guamna/device.mk
sleep 3

# Backup & Copy guamna_defconfig File
echo "Backing Up Original guamna_defconfig In Device Tree..."
echo ""
echo "1/1..."
echo ""
mv kernel/motorola/msm-4.19/arch/arm64/configs/vendor/guamna_defconfig kernel/motorola/msm-4.19/arch/arm64/configs/vendor/guamna_defconfig.bak
sleep 3
echo "Copying Modified guamna_defconfig Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/kernel/motorola/msm-4.19/arch/arm64/configs/vendor/guamna_defconfig kernel/motorola/msm-4.19/arch/arm64/configs/vendor
sleep 3

# Patch For Dirty Kernel
echo "Applying Dirty Kernel Patch..."
echo ""
echo "1/2..."
echo ""
cd kernel/motorola/msm-4.19
git add .
sleep 3
echo "2/2..."
echo ""
git commit -m "tmp"
echo ""
sleep 3
cd ../../../



# Hanoip Setup
##########################################################################################################

# Move Files To Location
echo "Copying Hanoip Files Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/hanoip/rro_overlays device/motorola/hanoip
sleep 3

# Patch device.mk
echo "Patching Hanoip device.mk In Device Tree..."
echo ""
echo "1/2..."
echo ""
sed -i 's\PRODUCT_MODEL := moto g(60)\PRODUCT_MODEL := Moto G40 Fusion / Moto G60\g' device/motorola/hanoip/device.mk
sleep 3
echo "2/2..."
echo ""
sed -i '/DEVICE_CHARACTERISTICS += hfr/ a\\ \n# Disable Adaptive Brightness\nPRODUCT_PACKAGES += hanoipSettingsProviderOverlay' device/motorola/hanoip/device.mk
sleep 3

# Backup & Copy hanoip_defconfig File
echo "Backing Up Original hanoip_defconfig In Device Tree..."
echo ""
echo "1/1..."
echo ""
mv kernel/motorola/msm-4.14-hanoip/arch/arm64/configs/vendor/hanoip_defconfig kernel/motorola/msm-4.14-hanoip/arch/arm64/configs/vendor/hanoip_defconfig.bak
sleep 3
echo "Copying Modified hanoip_defconfig Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/kernel/motorola/msm-4.14-hanoip/arch/arm64/configs/vendor/hanoip_defconfig kernel/motorola/msm-4.14-hanoip/arch/arm64/configs/vendor
sleep 3

# Patch For Dirty Kernel
echo "Applying Dirty Kernel Patch..."
echo ""
echo "1/2..."
echo ""
cd kernel/motorola/msm-4.14-hanoip
git add .
sleep 3
echo "2/2..."
echo ""
git commit -m "tmp"
echo ""
sleep 3
cd ../../../



# Milanf Setup
##########################################################################################################

# Move Files To Location
echo "Copying Milanf Files Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/milanf/rro_overlays device/motorola/milanf
sleep 3

# Patch BoardConfig.mk
echo "Patching Milanf BoardConfig.mk In Device Tree..."
echo ""
echo "1/1..."
echo ""
sed -i 's/^BOARD_MOT_DYNAMIC_PARTITIONS_SIZE :=.*/BOARD_MOT_DYNAMIC_PARTITIONS_SIZE := 9827254272/' device/motorola/milanf/BoardConfig.mk
sleep 3

# Patch device.mk
echo "Patching Milanf device.mk In Device Tree..."
echo ""
echo "1/2..."
echo ""
sed -i 's/PRODUCT_MODEL := moto g stylus 5g 2022/PRODUCT_MODEL := Moto G Stylus 5G 2022/g' device/motorola/milanf/device.mk
sleep 3
echo "2/2..."
echo ""
sed -i '/DEVICE_CHARACTERISTICS += hfr/ a\\ \n# Disable Adaptive Brightness\nPRODUCT_PACKAGES += milanfSettingsProviderOverlay' device/motorola/milanf/device.mk
sleep 3

# Backup & Copy milanf_defconfig File
echo "Backing Up Original milanf_defconfig In Device Tree..."
echo ""
echo "1/1..."
echo ""
mv kernel/motorola/msm-5.4/arch/arm64/configs/vendor/milanf_defconfig kernel/motorola/msm-5.4/arch/arm64/configs/vendor/milanf_defconfig.bak
sleep 3
echo "Copying Modified milanf_defconfig Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/kernel/motorola/msm-5.4/arch/arm64/configs/vendor/milanf_defconfig kernel/motorola/msm-5.4/arch/arm64/configs/vendor
sleep 3

# Patch For Dirty Kernel
echo "Applying Dirty Kernel Patch..."
echo ""
echo "1/2..."
echo ""
cd kernel/motorola/msm-5.4
git add .
sleep 3
echo "2/2..."
echo ""
git commit -m "tmp"
echo ""
sleep 3
cd ../../../



# Osaka Setup
##########################################################################################################

# Move Files To Location
echo "Copying Osaka Files Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/osaka/rro_overlays device/motorola/osaka
sleep 3

# Patch BoardConfig.mk
echo "Patching Osaka BoardConfig.mk In Device Tree..."
echo ""
echo "1/1..."
echo ""
sed -i 's/^BOARD_MOT_DYNAMIC_PARTITIONS_SIZE :=.*/BOARD_MOT_DYNAMIC_PARTITIONS_SIZE := 13954449408/' device/motorola/osaka/BoardConfig.mk
sleep 3

# Patch device.mk
echo "Patching Osaka device.mk In Device Tree..."
echo ""
echo "1/2..."
echo ""
sed -i 's/PRODUCT_MODEL := moto g stylus 5g 2021/PRODUCT_MODEL := Moto G Stylus 5G 2021/g' device/motorola/osaka/device.mk
sleep 3
echo "2/2..."
echo ""
sed -i '/    ro.sf.lcd_density=420/ a\\ \n# Disable Adaptive Brightness\nPRODUCT_PACKAGES += osakaSettingsProviderOverlay' device/motorola/osaka/device.mk
sleep 3

# Backup & Copy osaka_defconfig File
echo "Backing Up Original osaka_defconfig In Device Tree..."
echo ""
echo "1/1..."
echo ""
mv kernel/motorola/msm-5.4/arch/arm64/configs/vendor/osaka_defconfig kernel/motorola/msm-5.4/arch/arm64/configs/vendor/osaka_defconfig.bak
sleep 3
echo "Copying Modified osaka_defconfig Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/kernel/motorola/msm-5.4/arch/arm64/configs/vendor/osaka_defconfig kernel/motorola/msm-5.4/arch/arm64/configs/vendor
sleep 3

# Patch For Dirty Kernel
echo "Applying Dirty Kernel Patch..."
echo ""
echo "1/2..."
echo ""
cd kernel/motorola/msm-5.4
git add .
sleep 3
echo "2/2..."
echo ""
git commit -m "tmp"
echo ""
sleep 3
cd ../../../



# Yume Setup
##########################################################################################################

# Move Files To Location
echo "Copying Yume Files Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/device/motorola/yume/rro_overlays device/motorola/yume
sleep 3

# Patch BoardConfig.mk
echo "Patching Yume BoardConfig.mk In Device Tree..."
echo ""
echo "1/1..."
echo ""
sed -i 's/^BOARD_MOT_DYNAMIC_PARTITIONS_SIZE :=.*/BOARD_MOT_DYNAMIC_PARTITIONS_SIZE := 6782189568/' device/motorola/yume/BoardConfig.mk
sleep 3

# Patch device.mk
echo "Patching Yume device.mk In Device Tree..."
echo ""
echo "1/2..."
echo ""
sed -i 's/PRODUCT_MODEL := moto g stylus 5g 2023/PRODUCT_MODEL := Moto G Stylus 5G 2023/g' device/motorola/yume/device.mk
sleep 3
echo "2/2..."
echo ""
sed -i '/DEVICE_CHARACTERISTICS += hfr/ a\\ \n# Disable Adaptive Brightness\nPRODUCT_PACKAGES += yumeSettingsProviderOverlay' device/motorola/yume/device.mk
sleep 3

# Backup & Copy yume_defconfig File
echo "Backing Up Original yume_defconfig In Device Tree..."
echo ""
echo "1/1..."
echo ""
mv kernel/motorola/msm-5.10/arch/arm64/configs/vendor/yume_defconfig kernel/motorola/msm-5.10/arch/arm64/configs/vendor/yume_defconfig.bak
sleep 3
echo "Copying Modified yume_defconfig Into Device Tree..."
echo ""
echo "1/1..."
echo ""
cp -r $A_TEAM_PACKAGE_LOCATION/kernel/motorola/msm-5.10/arch/arm64/configs/vendor/yume_defconfig kernel/motorola/msm-5.10/arch/arm64/configs/vendor
sleep 3

# Patch For Dirty Kernel
echo "Applying Dirty Kernel Patch..."
echo ""
echo "1/2..."
echo ""
cd kernel/motorola/msm-5.10
git add .
sleep 3
echo "2/2..."
echo ""
git commit -m "tmp"
echo ""
sleep 3
cd ../../../



##########################################################################################################


echo ""
echo "A-Team Moto-Common Setup Complete, Please Enjoy!!"
echo ""
echo ""
echo "PRESS ENTER TO CONTINUE"
read
clear
rm -rf Moto-Common-Setup.sh
./Moto-Common-Build.sh
