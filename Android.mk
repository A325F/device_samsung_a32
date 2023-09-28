#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),a32)
include $(call all-subdir-makefiles,$(LOCAL_PATH))

VULKAN_SYMLINKS := $(TARGET_OUT_VENDOR)
$(VULKAN_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating vulkan symlinks: $@"
	@mkdir -p $@/lib/hw/
	@mkdir -p $@/lib64/hw/
	@ln -sf $@/lib/egl/libGLES_mali.so $@/lib/hw/vulkan.$(TARGET_BOARD_PLATFORM).so
	@ln -sf $@/lib64/egl/libGLES_mali.so $@/lib64/hw/vulkan.$(TARGET_BOARD_PLATFORM).so

ALL_DEFAULT_INSTALLED_MODULES += $(VULKAN_SYMLINKS)

endif
