LOCAL_PATH:= $(call my-dir)

# ========================================================
# libglob.a
# ========================================================
include $(CLEAR_VARS)

# dcigettext.c, localealias.c needs fixing
# l10nflist.c needs argz.h (glibc aarch64)

LOCAL_SRC_FILES:= \
	bindtextdom.c dgettext.c explodename.c gettext.c \
	localcharset.c localename.c dcgettext.c dcngettext.c \
	dngettext.c finddomain.c intl-compat.c loadmsgcat.c \
	log.c

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

LOCAL_MODULE := libintl

include $(BUILD_STATIC_LIBRARY)

# ========================================================
include $(call all-makefiles-under,$(LOCAL_PATH))
