#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2024 Electimon
#

# Common
include device/motorola/targets/include/common.mk

# Kernel
$(call inherit-product, device/motorola/targets/include/kernel/source.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# AlphaDroid
ALPHA_BUILD_TYPE := UNOFFICIAL
ALPHA_MAINTAINER := PizzaG
EXTRA_UDFPS_ANIMATIONS := false
TARGET_HAS_UDFPS := false
TARGET_ENABLE_BLUR := false
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_SUPPORTS_CALL_RECORDING := true
#WITH_GMS=true

# AlphaDroid Gapps Selection
# TARGET_BUILD_PACKAGE options:
# 1 - vanilla (default)
# 2 - microg
# 3 - gapps
ifeq ($(ROM_BUILD_TYPE),GAPPS)
  TARGET_BUILD_PACKAGE := 3
else
  ifeq ($(ROM_BUILD_TYPE),MICROG)
    TARGET_BUILD_PACKAGE := 2
  endif
endif

# Required Scripts
$(warning This ROM requires replace_camera_sepolicy.sh to be ran...)

PRODUCT_NAME := lineage_$(DEVICE)
