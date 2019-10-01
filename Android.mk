#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

LOCAL_PATH := $(call my-dir)

ifeq ($(filter-out kagura kagura_ds,$(TARGET_DEVICE)),)

# IMS links
IMS_LIBS := libimscamera_jni.so libimsmedia_jni.so
IMS_SYMLINKS := $(addprefix $(TARGET_OUT_APPS_PRIVILEGED)/ims/lib/arm64/,$(notdir $(IMS_LIBS)))
$(IMS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "IMS lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(IMS_SYMLINKS)

# RFS symlinks
RFS_SYMLINKS := $(TARGET_OUT_VENDOR)/grfs
$(RFS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "RFS links"
	@rm -rf $(TARGET_OUT_VENDOR)/grfs
	@mkdir -p $(TARGET_OUT_VENDOR)/grfs/apq/gnss/readonly
	$(hide) ln -sf /persist/hlos_rfs/shared $(TARGET_OUT_VENDOR)/grfs/apq/gnss/hlos
	$(hide) ln -sf /data/tombstones/lpass $(TARGET_OUT_VENDOR)/grfs/apq/gnss/ramdumps
	$(hide) ln -sf /persist/rfs/apq/gnss $(TARGET_OUT_VENDOR)/grfs/apq/gnss/readwrite
	$(hide) ln -sf /persist/rfs/shared $(TARGET_OUT_VENDOR)/grfs/apq/gnss/shared
	$(hide) ln -sf /firmware $(TARGET_OUT_VENDOR)/grfs/apq/gnss/readonly/firmware
	@mkdir -p $(TARGET_OUT_VENDOR)/grfs/msm/adsp/readonly
	$(hide) ln -sf /persist/hlos_rfs/shared $(TARGET_OUT_VENDOR)/grfs/msm/adsp/hlos
	$(hide) ln -sf /data/tombstones/lpass $(TARGET_OUT_VENDOR)/grfs/msm/adsp/ramdumps
	$(hide) ln -sf /persist/rfs/msm/adsp $(TARGET_OUT_VENDOR)/grfs/msm/adsp/readwrite
	$(hide) ln -sf /persist/rfs/shared $(TARGET_OUT_VENDOR)/grfs/msm/adsp/shared
	$(hide) ln -sf /firmware $(TARGET_OUT_VENDOR)/grfs/msm/adsp/readonly/firmware
	@mkdir -p $(TARGET_OUT_VENDOR)/grfs/msm/mpss/readonly
	$(hide) ln -sf /persist/hlos_rfs/shared $(TARGET_OUT_VENDOR)/grfs/msm/mpss/hlos
	$(hide) ln -sf /data/tombstones/lpass $(TARGET_OUT_VENDOR)/grfs/msm/mpss/ramdumps
	$(hide) ln -sf /persist/rfs/msm/mpss $(TARGET_OUT_VENDOR)/grfs/msm/mpss/readwrite
	$(hide) ln -sf /persist/rfs/shared $(TARGET_OUT_VENDOR)/grfs/msm/mpss/shared
	$(hide) ln -sf /firmware $(TARGET_OUT_VENDOR)/grfs/msm/mpss/readonly/firmware

ALL_DEFAULT_INSTALLED_MODULES += $(RFS_SYMLINKS)

KEYMASTER_IMPL_SYMLINK := $(TARGET_OUT_VENDOR)/lib64/android.hardware.keymaster@3.0-impl.so
$(KEYMASTER_IMPL_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating keymaster impl symlink: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf hw/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(KEYMASTER_IMPL_SYMLINK)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
