#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2023 Electimon
#

# Common
include device/motorola/targets/include/common.mk

# Inherit some common Rising OSS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

## RisingOS Build Flags
RISING_CHIPSET := "Snapdragon 695 5G"
WITH_GMS := true
TARGET_USE_PIXEL_FINGERPRINT := true
TARGET_OPTOUT_GOOGLE_TELEPHONY := false
TARGET_SUPPORTS_NEXT_GEN_ASSISTANT := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_HAS_UDFPS := false
TARGET_ENABLE_BLUR := false
RISING_PACKAGE_TYPE := Gapps

# Cameras
TARGET_BUILD_GRAPHENEOS_CAMERA := false
TARGET_BUILD_APERTURE_CAMERA := false

# Maintainer
RISING_MAINTAINER := PizzaG

# Kernel
$(call inherit-product, device/motorola/targets/include/kernel/source.mk)

# Required Scripts
$(warning This ROM requires replace_camera_sepolicy.sh to be ran...)

PRODUCT_NAME := rising_$(DEVICE)

