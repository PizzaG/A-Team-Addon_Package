#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2023 Electimon
#

# Common
include device/motorola/targets/include/common.mk

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Kernel
$(call inherit-product, device/motorola/targets/include/kernel/source.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080
#$(call inherit-product, vendor/v4afx/config.mk)

# AlphaDroid
ALPHA_BUILD_TYPE := UNOFFICIAL
ALPHA_MAINTAINER := PizzaG
WITH_GAPPS := true
EXTRA_UDFPS_ANIMATIONS := false
TARGET_HAS_UDFPS := false
TARGET_ENABLE_BLUR := false
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_SUPPORTS_CALL_RECORDING := true


# Required Scripts
$(warning This ROM requires replace_camera_sepolicy.sh to be ran...)

PRODUCT_NAME := lineage_$(DEVICE)
