#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2023 Electimon
#

# Common
include device/motorola/targets/include/common.mk

# Inherit some common Evolution X stuff.
$(call inherit-product, vendor/evolution/config/common_full_phone.mk)

# EvolutionX Device Maintainer
PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="PizzaG"

# EvolutionX Flags
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_SUPPORTS_QUICK_TAP := true

# Kernel
$(call inherit-product, device/motorola/targets/include/kernel/source.mk)

# Required Scripts
$(warning This ROM requires replace_camera_sepolicy.sh to be ran...)

PRODUCT_NAME := evolution_$(DEVICE)
