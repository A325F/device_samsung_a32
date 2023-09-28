#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from a32 device
$(call inherit-product, device/samsung/a32/device.mk)

PRODUCT_DEVICE := a32
PRODUCT_NAME := lineage_a32
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A325F
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="a32xx-user 13 TP1A.220624.014 A325FXXU6DWH3 release-keys"

BUILD_FINGERPRINT := samsung/a32xx/a32:12/SP1A.210812.016/A325FXXU6DWH3:user/release-keys
