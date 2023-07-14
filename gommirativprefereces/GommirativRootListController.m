#import <Foundation/Foundation.h>
#import "GommirativRootListController.h"

@implementation GommirativRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

@end
