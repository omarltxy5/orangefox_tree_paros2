#
# Copyright (C) 2023 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2024-2025 The OrangeFox Recovery Project
# SPDX-License-Identifier: GPL-3.0-or-later
#

PRODUCT_RELEASE_NAME := paros
DEVICE_PATH := device/motorola/$(PRODUCT_RELEASE_NAME)

# Inherit from those products
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device configuration
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Fox settings
$(call inherit-product-if-exists, $(DEVICE_PATH)/fox_$(PRODUCT_RELEASE_NAME).mk)

# Inherit from TWRP common configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier
PRODUCT_DEVICE := $(PRODUCT_RELEASE_NAME)
PRODUCT_NAME := twrp_$(PRODUCT_RELEASE_NAME)
PRODUCT_BRAND := Motorola
PRODUCT_MODEL := Moto G75 5G
PRODUCT_MANUFACTURER := Motorola
PRODUCT_GMS_CLIENTID_BASE := android-motorola
#
