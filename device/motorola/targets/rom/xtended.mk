#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2023 Electimon
#

# Common
include device/motorola/targets/include/common.mk

# Inherit some common Elixir stuff
$(call inherit-product, vendor/xtended/config/common_full_phone.mk)

# Xtended Build Flags
XTENDED_BUILD_TYPE := UNOFFICIAL
XTENDED_BUILD_MAINTAINER := PizzaG
XTENDED_BUILD_DONATE_URL := https://paypal.me/PizzaG98
PROCESSOR_MODEL := Snapdragon 695 5G
TARGET_BOOT_ANIMATION_RES := 1080
EXTRA_UDFPS_ANIMATIONS := false

# Gapps
WITH_GAPPS=true

# Kernel
$(call inherit-product, device/motorola/targets/include/kernel/source.mk)

# Required Scripts
$(warning This ROM requires replace_camera_sepolicy.sh to be ran...)

PRODUCT_NAME := xtended_$(DEVICE)

