LOCAL_PATH:= $(call my-dir)

# ========================================================
# bash
# ========================================================
include $(CLEAR_VARS)

# Somehow broken: nojobs.c

LOCAL_SRC_FILES:= \
	shell.c assoc.c bracecomp.c dispose_cmd.c execute_cmd.c flags.c hashlib.c \
	list.c make_cmd.c pathexp.c print_cmd.c sig.c subst.c trap.c version.c \
	array.c bashhist.c braces.c error.c expr.c general.c input.c locale.c \
	pcomplete.c redir.c siglist.c syntax.c unwind_prot.c xmalloc.c \
	arrayfunc.c bashline.c copy_cmd.c eval.c findcmd.c hashcmd.c jobs.c mailcheck.c \
	pcomplib.c alias.c test.c stringlib.c variables.c y.tab.c
	
LOCAL_C_INCLUDES += \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/lib
LOCAL_CFLAGS += \
	-DHAVE_CONFIG_H \
	-DPROGRAM=\"bash\" \
	-DPACKAGE=\"bash\" \
	-DCONF_HOSTTYPE=\"arm\" \
	-DCONF_OSTYPE=\"android-eabi\" \
	-DCONF_MACHTYPE=\"arm-android-eabi\" \
	-DCONF_VENDOR=\"unknown\" \
	-DLOCALEDIR=\"/data/locale\" \
	-DSHELL
LOCAL_SHARED_LIBRARIES += \
	libncurses
LOCAL_STATIC_LIBRARIES += \
	libbuiltins \
	libglob \
	libsh \
	libtilde \
	libhistory \
	libreadline \
	libintl \
	malloc
LOCAL_CFLAGS += \
	-Wno-char-subscripts \
	-Wno-format \
	-Wno-implicit-function-declaration \
	-Wno-incompatible-pointer-types \
	-Wno-incompatible-pointer-types-discards-qualifiers \
	-Wno-missing-field-initializers \
	-Wno-non-literal-null-conversion \
	-Wno-parentheses \
	-Wno-sign-compare \
	-Wno-sometimes-uninitialized \
	-Wno-switch \
	-Wno-unused-function \
	-Wno-unused-label \
	-Wno-unused-parameter \
	-Wno-unused-variable \
	-Wno-user-defined-warnings

LOCAL_MODULE := bash
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)

LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)

# ========================================================
# bash configs
# ========================================================
etc_files := $(wildcard $(LOCAL_PATH)/etc/*)

BASH_ETC := $(TARGET_OUT)/etc/$(LOCAL_MODULE)
BASH_CONFIGS := $(addprefix $(BASH_ETC)/,$(notdir $(etc_files)))
$(BASH_CONFIGS): $(BASH_ETC)/%: $(LOCAL_PATH)/etc/% | $(LOCAL_BUILT_MODULE)
	@echo "Install: $@ -> $(BASH_ETC)"
	@mkdir -p $(dir $@)
	$(hide) cp $< $@

ALL_DEFAULT_INSTALLED_MODULES += $(BASH_CONFIGS)

ALL_MODULES.$(LOCAL_MODULE).INSTALLED := \
    $(ALL_MODULES.$(LOCAL_MODULE).INSTALLED) $(BASH_CONFIGS)

# ========================================================
include $(call all-makefiles-under,$(LOCAL_PATH))
