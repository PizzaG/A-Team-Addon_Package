#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2024 Electimon
#

# Common
include device/motorola/targets/include/common.mk

# Inherit some common Bootleggers stuff.
$(call inherit-product, vendor/bootleggers/config/common.mk)

# Bootleggers Build Flags
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_USES_BLUR := false
TARGET_INCLUDE_LIVE_WALLPAPERS := true
TARGET_INCLUDE_STOCK_ARCORE := true

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Maintainer Prop
DEVICE_MAINTAINERS := "PizzaG"
BOOTLEGGERS_BUILD_TYPE := UNOFFICIAL
TARGET_BOOTLEG_ARCH := arm64
WITH_GAPPS := true

# Kernel
$(call inherit-product, device/motorola/targets/include/kernel/source.mk)

# Required Scripts
$(warning This ROM requires replace_camera_sepolicy.sh to be ran...)

PRODUCT_NAME := bootleg_$(DEVICE)
