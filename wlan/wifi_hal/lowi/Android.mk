# Copyright (C) 2011 The Android Open Source Project
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

LOCAL_PATH := $(call my-dir)

# Make the HAL library
# ============================================================
include $(CLEAR_VARS)

LOCAL_CFLAGS := -Wno-format -Wno-unused-parameter -fPIC -shared

LOCAL_C_INCLUDES += \
	external/libnl/include \
	$(call include-path-for, libhardware_legacy)/hardware_legacy \
	external/wpa_supplicant_8/src/drivers

LOCAL_SRC_FILES := \
	wifi_hal.cpp \
	rtt.cpp \
	common.cpp \
	cpp_bindings.cpp \
	lowi_api.cpp

LOCAL_MODULE := liblowi_wifihal
LOCAL_VENDOR_MODULE := true
LOCAL_SHARED_LIBRARIES := libutils libcutils liblog

ifneq ($(wildcard external/libnl),)
LOCAL_SHARED_LIBRARIES += libnl
else
LOCAL_STATIC_LIBRARIES += libnl_2
endif

include $(BUILD_SHARED_LIBRARY)

