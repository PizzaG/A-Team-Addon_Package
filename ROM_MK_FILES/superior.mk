#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2023 Electimon
#

# Common
include device/motorola/targets/include/common.mk

# Inherit some common stuff.
$(call inherit-product, vendor/superior/config/common.mk)

# SuperiorOS Build Flags
SUPERIOR_OFFICIAL := false
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_INCLUDE_PIXEL_CHARGER := true
SUPERIOR_UDFPS_ANIMATIONS := false
TARGET_ENABLE_BLUR := false
TARGET_IS_PIXEL_6 := false

# Superior Gapps
SUPERIOR_GAPPS := full
BUILD_WITH_GAPPS := true
TARGET_GAPPS_ARCH := arm64
TARGET_SUPPORTS_NOW_PLAYING := true
TARGET_INCLUDE_STOCK_ARCORE := true

# Superior Prebuilts
USE_QUICKPIC := true
USE_DUCKDUCKGO := false
USE_MOTO_CALCULATOR := true

# Kernel
$(call inherit-product, device/motorola/targets/include/kernel/source.mk)

# Required Scripts
$(warning This ROM requires replace_camera_sepolicy.sh to be ran...)

PRODUCT_NAME := superior_$(DEVICE)

