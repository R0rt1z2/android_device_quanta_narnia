LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := egl.cpp
LOCAL_SHARED_LIBRARIES := libui libgui libbinder
LOCAL_MODULE := libshim_egl
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := hwc.cpp
LOCAL_SHARED_LIBRARIES := libcutils
LOCAL_MODULE := libshim_hwc
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := audio.cpp
LOCAL_SHARED_LIBRARIES := libcutils liblog libutils libbinder
LOCAL_MODULE := libshim_audio
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_C_INCLUDES += frameworks/av/media/mtp/ system/core/include/ frameworks/rs/server/ frameworks/av/include/ hardware/libhardware/include/
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)
