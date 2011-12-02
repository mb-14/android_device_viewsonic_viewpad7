# Copyright 2006 The Android Open Source Project

ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),fm6)

MODULE.TARGET.SHARED_LIBRARIES.libril :=

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES:= \
    ril.cpp \
    ril_event.cpp

LOCAL_SHARED_LIBRARIES := \
    libutils \
    libbinder \
    libcutils \
    libhardware_legacy

LOCAL_CFLAGS :=

LOCAL_MODULE:= libril.fm6
LOCAL_MODULE_STEM := libril
LOCAL_MODULE_TAGS := optional

LOCAL_LDLIBS += -lpthread

include $(BUILD_SHARED_LIBRARY)

endif # TARGET_BOOTLOADER_BOARD_NAME
