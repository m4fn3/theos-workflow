TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = GommirativPrefereces

GommirativPrefereces_FILES = GommirativRootListController.m
GommirativPrefereces_FRAMEWORKS = UIKit
GommirativPrefereces_PRIVATE_FRAMEWORKS = Preferences
GommirativPrefereces_INSTALL_PATH = /Library/PreferenceBundles
GommirativPrefereces_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
