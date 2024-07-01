#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2024 Electimon
#

# Common
include device/motorola/targets/include/common.mk

# SkylineUI Build Flags
SKYLINEUI_MAINTAINER := PizzaG
CUSTOM_BUILD_TYPE := UNOFFICIAL

# Inherit common AOSP configurations
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_USES_AOSP_RECOVERY := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_CALL_RECORDING := true
TARGET_SUPPORTS_GOOGLE_RECORDER := true

# Boot Animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Google Camera
$(call inherit-product-if-exists, vendor/mgc/config.mk)

# Kernel
$(call inherit-product, device/motorola/targets/include/kernel/source.mk)

# VARIABLE - SePolicy Camera Script
$(warning This ROM requires replace_camera_sepolicy.sh to be ran...)

PRODUCT_NAME := aosp_$(DEVICE)
