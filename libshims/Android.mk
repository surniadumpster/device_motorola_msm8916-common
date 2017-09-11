# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
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

include $(CLEAR_VARS)

LOCAL_SRC_FILES := MediaCodec.cpp SensorManager.cpp moto_camera_misc.c

LOCAL_SHARED_LIBRARIES := libstagefright libmedia libutils libsensor liblog libbinder libbase

LOCAL_MODULE := libshims_camera
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := atomic.cpp
LOCAL_MODULE := libshim_atomic
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include $(BUILD_SHARED_LIBRARY)


ifeq $(call project-path-for,qcom-camera))
MM_V4L2_DRIVER_LIST += msm8960
MM_V4L2_DRIVER_LIST += msm8974
MM_V4L2_DRIVER_LIST += msm8226
MM_V4L2_DRIVER_LIST += msm8610
MM_V4L2_DRIVER_LIST += msm_bronze
MM_V4L2_DRIVER_LIST += msm8916
MM_V4L2_DRIVER_LIST += msm8909
LOCAL_32_BIT_ONLY := true
ifeq ($(call is-board-platform-in-list,$(MM_V4L2_DRIVER_LIST)),true)
    ifneq ($(BUILD_TINY_ANDROID),true)
      include $(call all-subdir-makefiles)
    endif
endif
endif
