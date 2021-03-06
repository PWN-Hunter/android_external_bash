LOCAL_PATH:= $(call my-dir)

# ========================================================
# malloc
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	alloca.c

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/../.. \
	$(LOCAL_PATH)/../../include \
	$(LOCAL_PATH)/../../lib

LOCAL_CFLAGS += \
	-DHAVE_CONFIG_H

LOCAL_CFLAGS += \
	-Wno-parentheses \
	-Wno-sign-compare \
	-Wno-unused-parameter \
	-Wno-unused-variable

LOCAL_MODULE_TAGS := optional

LOCAL_MODULE := malloc

include $(BUILD_STATIC_LIBRARY)

# ========================================================
include $(call all-makefiles-under,$(LOCAL_PATH))
