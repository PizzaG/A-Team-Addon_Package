#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2023 Electimon
#

# Common
include device/motorola/targets/include/common.mk

# Inherit some common Project-Elixir stuff
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

# Project-Elixir Build Flags
IS_PHONE := true
ELIXIR_BUILD_TYPE := UNOFFICIAL
BUILD_USERNAME := PizzaG
BUILD_HOSTNAME := Anroid_Builder
TARGET_INCLUDE_PIXEL_CHARGER := true
TARGET_SUPPORTS_NEXT_GEN_ASSISTANT := true
TARGET_SUPPORTS_QUICK_TAP := true
ELIXIR_MAINTAINER := PizzaG
EXTRA_UDFPS_ANIMATIONS := false
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_INCLUDE_STOCK_ACORE := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_CALL_RECORDING := true
TARGET_BUILD_APERTURE_CAMERA := false
TARGET_GAPPS_ARCH := arm64
TARGET_INCLUDE_LIVE_WALLPAPERS := true

# Kernel
$(call inherit-product, device/motorola/targets/include/kernel/source.mk)

# Required Scripts
$(warning This ROM requires replace_camera_sepolicy.sh to be ran...)

PRODUCT_NAME := aosp_$(DEVICE)
