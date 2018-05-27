LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE    := djinni

LOCAL_CPP_EXTENSION := .cpp

LOCAL_C_INCLUDES += $(LOCAL_PATH)

LOCAL_SRC_FILES := \
    djinni_main.cpp \
    djinni_support.cpp \
    rc_jni_manager.cpp

 
LOCAL_CPPFLAGS += -O3 -std=c++11 -fexceptions -frtti   

include $(BUILD_STATIC_LIBRARY)

