# TARGET := iphone:clang:latest:7.0
# INSTALL_TARGET_PROCESSES = mirrativ  # FINAL
#
# THEOS_DEVICE_IP=localhost
# THEOS_DEVICE_PORT=22
#
# include $(THEOS)/makefiles/common.mk
#
# TWEAK_NAME = Gommirativ
#
# Gommirativ_FILES = Tweak.x
# Gommirativ_CFLAGS = -fobjc-arc
#
# include $(THEOS_MAKE_PATH)/tweak.mk
# SUBPROJECTS += gommirativprefereces
# include $(THEOS_MAKE_PATH)/aggregate.mk


DEBUG=0
FINALPACKAGE=1
# GO_EASY_ON_ME=1

THEOS_PACKAGE_SCHEME = rootless

# THEOS_USE_NEW_ABI=1
TARGET = iphone:14.5:14.5
ARCHS = arm64 arm64e

THEOS_DEVICE_IP = 192.168.11.9 -p 22

INSTALL_TARGET_PROCESSES = mirrativ


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Gommirativ

Gommirativ_FILES = Tweak.xm
Gommirativ_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += gommirativprefereces
include $(THEOS_MAKE_PATH)/aggregate.mk
