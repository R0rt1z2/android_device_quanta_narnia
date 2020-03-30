LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_CFLAGS += $(LIBLOG_CFLAGS)
LOCAL_SRC_FILES := narnia_egl.cpp narnia_hwc.cpp narnia_audio.cpp narnia_xlog.c
LOCAL_SHARED_LIBRARIES := libui libgui libbinder liblog libutils libEGL
LOCAL_MODULE := libnarnia
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_C_INCLUDES += frameworks/av/media/mtp/ system/core/include/ frameworks/rs/server/ frameworks/av/include/ hardware/libhardware/include/
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)
