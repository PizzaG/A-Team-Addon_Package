#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2023 Electimon
#

# Common
include device/motorola/targets/include/common.mk

# Inherit from the bliss configuration.
$(call inherit-product, vendor/bliss/config/common_full_phone.mk)

# Bootanimation
TARGET_BOOT_ANIMATION_RES := 1080

# Gapps
BLISS_BUILD_VARIANT := gapps
TARGET_STOCK_GAPPS := true

# UDFPS Animations
EXTRA_UDFPS_ANIMATIONS := false

# Face Unlock
TARGET_FACE_UNLOCK_SUPPORTED := true

# Kernel
$(call inherit-product, device/motorola/targets/include/kernel/source.mk)

# Required Scripts
$(warning This ROM requires replace_camera_sepolicy.sh to be ran...)

PRODUCT_NAME := bliss_$(DEVICE)
