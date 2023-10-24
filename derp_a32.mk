#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common DerpFest stuff.
$(call inherit-product, vendor/derp/config/common_full_phone.mk)

# Inherit from a32 device
$(call inherit-product, device/samsung/a32/device.mk)

TARGET_BOOT_ANIMATION_RES := 1080
WITH_GAPPS := true

# Device identifier. This must come after all inclusions.
PRODUCT_DEVICE := a32
PRODUCT_NAME := derp_a32
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A325F
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="a32xx-user 13 TP1A.220624.014 A325FXXU6DWH3 release-keys"

BUILD_FINGERPRINT := samsung/a32xx/a32:12/SP1A.210812.016/A325FXXU6DWH3:user/release-keys
